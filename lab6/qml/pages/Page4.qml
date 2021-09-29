import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 5")
                onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
            }
        }
        MyComponent{
            anchors.centerIn: parent
            Text {text:"Text on button"}
            color: "red"
        }
    }
}
