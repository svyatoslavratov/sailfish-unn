import QtQuick 2.0
import Sailfish.Silica 1.0
import "../elements"
import "../calculator.js" as CALC

Page {
    id: page

    property string formula_text: '';
    property string brackets_added: '';
    property string formula_text_for_engine: '';
    property string answer: '';
    property string angularUnit: "RAD"

    property var formula: []

    function formulaPush(visual, engine, type) {
        var prev = null;
        if (formula.length > 0)
            prev = formula[formula.length-1];

        var result = CALC.getFormulaTexts(prev, visual, engine, type, brackets_added.length/2)

        var visual_text = result[0];
        var engine_text = result[1];
        var fixed_type = result[2];
        var brackets_count = result[3];

        brackets_added = brackets_added.substr(0, brackets_count*2);

        if (visual_text !== null && engine_text !== null) {
            formula_text += visual_text;
            formula_text_for_engine += engine_text;
            formula.push({'visual': visual_text, 'engine': engine_text, 'type': fixed_type});

            answer = calculate()
        }
    }

    function formulaPop() {
        if (formula.length > 0) {
            var prev = formula[formula.length-1];
            formula_text = formula_text.substring(0, formula_text.length - prev.visual.length);
            formula_text_for_engine = formula_text_for_engine.substring(0, formula_text_for_engine.length - prev.engine.length);
            if (prev.type === 'function' || (prev.type === 'group' && prev.engine === '(' || prev.engine === '*('))
                brackets_added = brackets_added.substring(0, brackets_added.length-2)
            else if (prev.type === 'group' && prev.engine === ')')
                brackets_added += " )"
            formula.pop();

            answer = calculate()
        }
    }

    function formulaReset() {
        formula_text = '';
        formula_text_for_engine = '';
        formula = [];
        answer = "";
        brackets_added = '';
    }

    function calculate() {

        var result = 0;
        try {
            result = CALC.parse(angularUnit + formula_text_for_engine + brackets_added);
            if (result === Number.POSITIVE_INFINITY)
                result = '∞';
            else if (result === Number.NEGATIVE_INFINITY)
                result = '-∞';
        } catch(exception) {
            if(exception instanceof CALC.DivisionByZeroError){
                result = "division by zero error";
            } else if(exception instanceof SyntaxError){
                result = "";
            } else if(exception instanceof CALC.ParenthesisError){
                if(exception.missing === '(')
                    brackets_added = brackets_added.substr(0, brackets_added.length-2);
                else
                    brackets_added+=(' '+exception.missing);
                result = calculate();
            }
        }
        return result;
    }

    function addFromMemory(answerToAdd, formulaData) {
        if (answerToAdd !== '' && answerToAdd.indexOf('error') === -1 && answerToAdd.indexOf('∞') === -1) {
            for (var i = 0; i < answerToAdd.length; i++)
                formulaPush(answerToAdd[i], answerToAdd[i], answerToAdd[i] === '.' ? 'real' : 'number')
        }
        else {
            var fd = JSON.parse(formulaData);

            var prev = null;
            if (formula.length > 0)
                prev = formula[formula.length-1];

            var result = CALC.getFormulaTexts(prev, fd[0].engine, fd[0].engine, fd[0].type, brackets_added.length/2)

            if (result[0] !== null && result[1] !== null) {
                for (var idx = 0; idx < fd.length; idx++) {
                    formula_text += fd[idx].visual;
                    formula_text_for_engine += fd[idx].engine;
                    formula.push({'visual': fd[idx].visual, 'engine': fd[idx].engine, 'type': fd[idx].type});
                }
                answer = calculate()
            }
        }
    }

    // To enable PullDownMenu for different triginimetric func, place our content in a SilicaFlickable
    SilicaListView {
        id: formulaView
        anchors.fill: parent
        snapMode: ListView.SnapOneItem


        property string currentFormula: '%1<font color="lightgray">%2</font>'.arg(formula_text).arg(brackets_added)
        property string currentAnswer: answer
        property int screenHeight: 0

        function addCurrentToMemory() {
            if(formula_text === '') return;
            memory.get(memory.count-1).isLastItem = false
            memory.get(memory.count-1).formula_data = JSON.stringify(formula)
            memory.append({'formula': memory.get(memory.count-1).formula, 'answer': memory.get(count-1).answer, 'formula_data': '', 'isLastItem': true})
            positionViewAtIndex(memory.count-1, ListView.Beginning);
        }

        function showError() {
            animateError.start()
        }

        PropertyAnimation {id: animateError; target: formulaView; properties: "color"; from: "#FFA0A0"; to: "#FFFFFF"; duration: 100}

        delegate: Screen {
            id: calcScreen
            width: formulaView.width

            onUseAnswer: addFromMemory(answerToUse, formulaData)

            Component.onCompleted: {
                if (formulaView.screenHeight == 0)
                    formulaView.screenHeight = height
            }
        }

        footer: Keyboard{
            width: parent.width
            height: page.height - formulaView.screenHeight
        }

        model: Memory { id: memory }

        onCurrentFormulaChanged: {
            memory.get(memory.count-1).formula = currentFormula
            positionViewAtIndex(memory.count-1, ListView.Beginning);
        }

        onCurrentAnswerChanged: {
            memory.get(memory.count-1).answer = currentAnswer
        }
    }
}
