import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 4")
                onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
            }
        }
        TrafficLight{}
    }
}
