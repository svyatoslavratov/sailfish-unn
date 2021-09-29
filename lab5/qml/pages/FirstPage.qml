import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        ListModel {
            id: dataModel
            ListElement {color: "white"; text: "White"}
            ListElement {color: "red"; text: "Red"}
            ListElement {color: "skyblue"; text: "Green"}
        }

        SilicaListView {
            anchors.fill: parent
            model:dataModel
            delegate: Rectangle {
                    width:parent.width
                    height: 100
                    color: model.color
                    Text {
                        anchors.centerIn:parent
                        text:model.text
                }
            }
        }
    }
}
