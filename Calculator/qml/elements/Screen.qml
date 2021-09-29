import QtQuick 2.0
import Sailfish.Silica 1.0

Item{
    id: root
    height: columnA.height + 30
    transformOrigin: Item.Bottom
    state: "current"

    signal useAnswer(string answerToUse, string formulaData)

    Column {
        id: columnA
        spacing: 10
        width: parent.width - 8
        anchors{
            top: parent.top
            left: parent.left
            leftMargin: 4
        }

        Label{
            id: drg
            visible: isLastItem
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeExtraSmall
            color: Theme.secondaryColor
            height: lineHeight + 10
            text: angularUnit[0]
        }

        Row{
            width: parent.width
            height: formulaLabel.height
            spacing: 4
            Label {
                id: formulaLabel
                width: parent.width- backBtn.width -4
                height: font.pixelSize + 10
                horizontalAlignment: Text.AlignRight
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeExtraLarge
                text: formula
            }
            IconButton{
                id: backBtn
                visible: isLastItem
                width: (!visible) ? 0 : height
                icon.source: "image://Theme/icon-l-backspace"
                onClicked: formulaPop()
                onPressAndHold: formulaReset()
            }
        }

        Label {
            id: answerLabel
            width: parent.width
            height: font.pixelSize + 10
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeExtraLarge
            elide: Text.ElideRight
            clip: true
            text: '= %1'.arg(answer)
        }
    }

    GlassItem {
        id: divider
        anchors.top: parent.top
        anchors.topMargin: (height/2)*-1
        anchors.horizontalCenter: parent.horizontalCenter
        objectName: "menuitem"
        height: Theme.paddingLarge
        width: parent.width
        color: Theme.highlightColor
        cache: false
    }

    MouseArea {
        id: screenMA
        anchors.fill: parent
        visible: !isLastItem
        onClicked: {
            if (answer.indexOf('error') === -1)
                root.useAnswer(answer, formula_data)
        }
    }

    states: [
        State {
            name: "one"
            when: memory.count === 1
            PropertyChanges {
                target: divider
                visible: false
            }
        },
        State {
            name: "more"
            when: memory.count > 1
            PropertyChanges {
                target: divider
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            from: "one"
            to: "more"
            NumberAnimation { target: divider; property: "opacity"; from: 0; to: 1; duration: 500 }
        }
    ]
}
