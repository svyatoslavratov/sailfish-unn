import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
            }
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            id: label1
            text: "Hello world!"
            font.pixelSize: 100
            color: "white"
            state: "up"
            states: [
                State {
                    name: "up"
                    PropertyChanges {
                        target: label1
                        y: 50
                    }
                },
                State {
                    name: "down"
                    PropertyChanges {
                        target: label1
                        y: 1200
                        color:"green"
                        rotation: 180
                    }
                }
            ]
            transitions: [
                Transition {
                    to: "down"
                    SequentialAnimation {
                        PropertyAnimation {
                            property: "y";
                            duration: 3000
                        }
                    }
                    RotationAnimation {
                        duration: 3000;
                        direction: RotationAnimation.Counterclockwise
                    }
                },
                Transition {
                    to: "up"
                    SequentialAnimation {
                        PropertyAnimation {
                            property: "y";
                            duration: 3000
                        }
                    }
                    RotationAnimation {
                        duration: 3000;
                        direction: RotationAnimation.Clockwise
                    }
                }
            ]
            MouseArea {
                anchors.fill:parent
                onPressed: parent.state = "down"
                onReleased: parent.state = "up"
            }
        }
    }
}
