import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    width: parent.width
    height: keyboard.height + 24

    property int buttonWidth: 100
    property int buttonHeigt: 65

    Grid{
        id: keyboard
        columns: 4

        rowSpacing: 12
        columnSpacing: (parent.width - (buttonWidth * 4)) / 5

        anchors.centerIn: parent

        KeyboardButton {
            text: "sin"
            onClicked: formulaPush('sin', 'sin', 'function')
        }

        KeyboardButton {
            text: "cos"
            onClicked: formulaPush('cos', 'cos', 'function')
        }

        KeyboardButton {
            text: "tan"
            onClicked: formulaPush('tan', 'tan', 'function')
        }

        KeyboardButton {
            text: "asin"
            onClicked: formulaPush('asin', 'asin', 'function')
        }

        KeyboardButton {
            text: "acos"
            onClicked: formulaPush('acos', 'acos', 'function')
        }

        KeyboardButton {
            text: "atan"
            onClicked: formulaPush('atan', 'atan', 'function')
        }


        KeyboardButton {
            text: "ln"
            onClicked: formulaPush('ln', 'ln', 'function')
        }

        KeyboardButton {
            text: "π"
            onClicked: formulaPush('π', 'π', 'const')
        }

        KeyboardButton {
            text: "e"
            onClicked: formulaPush('e', 'E', 'const')
        }

        KeyboardButton {
            text: "log"
            onClicked: formulaPush('log', 'log', 'function')
        }

        KeyboardButton {
            text: "!"
            onClicked: formulaPush('!', '!', 'operation')
        }

        KeyboardButton {
            text: "^"
            onClicked: formulaPush('^', '^', 'operation')
        }

        KeyboardButton {
            text: "("
            onClicked: formulaPush('(', '(', 'group')
        }

        KeyboardButton {
            text: ")"
            onClicked: formulaPush(')', ')', 'group')
        }

        KeyboardButton {
            text: "%"
            onClicked: formulaPush('%', '%', 'operation')
        }

        KeyboardButton {
            text: "√"
            onClicked: formulaPush('√', '√', 'function')
        }

        KeyboardButton {
            text: "7"
            onClicked: formulaPush('7', '7', 'number')
        }

        KeyboardButton {
            text: "8"
            onClicked: formulaPush('8', '8', 'number')
        }

        KeyboardButton {
            text: "9"
            onClicked: formulaPush('9', '9', 'number')
        }

        KeyboardButton {
            text: "÷"
            onClicked: formulaPush('÷', '/', 'operation')
        }

        KeyboardButton {
            text: "4"
            onClicked: formulaPush('4', '4', 'number')
        }

        KeyboardButton {
            text: "5"
            onClicked: formulaPush('5', '5', 'number')
        }

        KeyboardButton {
            text: "6"
            onClicked: formulaPush('6', '6', 'number')
        }

        KeyboardButton {
            text: "×"
            onClicked: formulaPush('×', '*', 'operation')
        }

        KeyboardButton {
            text: "1"
            onClicked: formulaPush('1', '1', 'number')
        }

        KeyboardButton {
            text: "2"
            onClicked: formulaPush('2', '2', 'number')
        }

        KeyboardButton {
            text: "3"
            onClicked: formulaPush('3', '3', 'number')
        }

        KeyboardButton {
            text: "+"
            onClicked: formulaPush('+', '+', 'operation')
        }

        KeyboardButton {
            text: "0"
            onClicked: formulaPush('0', '0', 'number')
        }

        KeyboardButton {
            text: "."
            onClicked: formulaPush('.', '.', 'real')
        }

        KeyboardButton {
            text: "C"
            onClicked: {
                formulaView.addCurrentToMemory();
                formulaReset();
            }
        }

        KeyboardButton {
            text: "−"
            onClicked: formulaPush('−', '-', 'operation')
        }

    }
}
