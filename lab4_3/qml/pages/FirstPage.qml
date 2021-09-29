import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    Column {
        y: 400
        width: parent.width
        spacing: Theme.paddingMedium
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Open dialog"
            onClicked: pageStack.push(dialog)
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            id: label
        }
    }
    Dialog {
        id: dialog
        Column {
            width:parent.width
            spacing: 30
            DialogHeader {
                title: "Enter text dialog"
            }
            TextField {
                placeholderText: "Enter text"
                id: textField
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
        onAccepted: label.text = textField.text
    }
}

