import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaListView {
        anchors.fill: parent
        model: 10
        delegate: ListItem {
            width:parent.width
            Label {
                anchors.centerIn: parent
                text: "Item list №" + index
                color: "white"
            }
            menu: ContextMenu {
                MenuItem {
                    text: "1'st item"
                    onClicked: console.log(text + " " + index)
                }
                MenuItem {
                    text: "2'st item"
                    onClicked: console.log(text + " " + index)
                }
                MenuItem {
                    text: "3'st item"
                    onClicked: console.log(text + " " + index)
                }
            }
        }
    }
}
