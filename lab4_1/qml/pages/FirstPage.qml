import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All
    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
        PageHeader{
            title: "Page"
        }
        Button {
            text: "Back"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Next"
            onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
        }
        Label {
            text: "Nested stack: " + pageStack.depth
        }
    }
}
