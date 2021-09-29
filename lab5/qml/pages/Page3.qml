import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property var dataModel: [
        {color: "white", text: "White"},
        {color: "red", text: "Red"},
        {color: "skyblue", text: "Blue"}
    ]
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 4")
                onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
            }
        }

        SilicaListView {
            anchors.fill: parent
            model:dataModel
            delegate: Rectangle {
                width:parent.width
                height: 100
                color: modelData.color
                Text {
                    anchors.centerIn:parent
                    text: modelData.text
                }
            }
        }
    }
}
