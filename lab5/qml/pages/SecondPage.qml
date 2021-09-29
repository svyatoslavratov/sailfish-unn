import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
            }
        }

        ListModel {
            property int myCount: 0
            id: dataModel
        }

        SilicaListView {
            id: listview
            width: parent.width; height: parent.height - addButton.height;
            model:dataModel
            delegate: Rectangle {
                id: rect
                width:parent.width; height: 70; color: "skyblue"
                Text {
                    anchors.centerIn:parent
                    text: model.text
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        dataModel.remove(index, 1)
                    }
                }
            }
        }
        Button {
            y: 1200
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add"
            onClicked:
            {
                dataModel.append({text: "Item " + (dataModel.myCount + 1)})
                dataModel.myCount++
            }
        }
    }
}
