import QtQuick 2.0
import Sailfish.Silica 1.0
import List 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: 20
        anchors.fill: parent
        Column {
            List {
                id: list
                onListChanged : {
                    label.text = list.getList()
                }
            }

            y:500
            spacing: 10
            width: parent.width
            TextField  {
                id: textField
                placeholderText: "Word"

            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Add word"
                onClicked: list.push(textField.text)
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Remove word"
                onClicked: list.pop()
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                id: label
            }
        }
    }
}
