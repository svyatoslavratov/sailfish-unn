import QtQuick 2.0
import Sailfish.Silica 1.0
import Counter 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All
    SilicaFlickable {
            anchors.fill: parent
            PullDownMenu {
                MenuItem {
                    text: qsTr("Show Page 2")
                    onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
                }
            }
            Counter {
                id: counter
                count: 10
                onCountChanged: label.text = counter.getCount()

            }

            Column {
                y:500
                spacing: 10
                width: parent.width
                Label {
                    id: label
                    y: 100
                    text: counter.getCount()
                    font.pixelSize: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Increment"
                    onClicked: counter.add()
                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Reset"
                    onClicked: counter.reset()
                }
            }
        }
}

