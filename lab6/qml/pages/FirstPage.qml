import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int pages: 0
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }
        Column {
            id: trafficLight
            y: 200
            width: parent.width
            spacing: 10
            state: "red"
            states: [
                State {
                    name: "red"
                    PropertyChanges {
                        target: redRect
                        color:"red"
                    }
                    PropertyChanges {
                        target: yellowRect
                        color:"black"
                    }
                    PropertyChanges {
                        target: greenRect
                        color:"black"
                    }
                },
                State {
                    name: "yellow"
                    PropertyChanges {
                        target: redRect
                        color:"black"
                    }
                    PropertyChanges {
                        target: yellowRect
                        color:"yellow"
                    }
                    PropertyChanges {
                        target: greenRect
                        color:"black"
                    }
                },
                State {
                    name: "green"
                    PropertyChanges {
                        target: redRect
                        color:"black"
                    }
                    PropertyChanges {
                        target: yellowRect
                        color:"black"
                    }
                    PropertyChanges {
                        target: greenRect
                        color:"green"
                    }
                }
            ]
            Rectangle {
                id: redRect
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: width
                radius: width*0.5
                color: "black"
            }
            Rectangle {
                id: yellowRect
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: width
                radius: width*0.5
                color: "black"
            }
            Rectangle {
                id: greenRect
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: width
                radius: width*0.5
                color: "black"
            }
            Timer {
                interval: 3000
                repeat: true
                running:true
                onTriggered:  {
                    var states = ["red", "yellow", "green"]
                    var nextIndex = (states.indexOf(parent.state) + 1) % states.length
                    if(parent.state === "yellow") {
                        if(human.state === "Right")
                            human.state = "Left"
                        else
                            human.state = "Right"
                    }
                    parent.state = states[nextIndex]
                }
            }
        }
        Image {
            id: human
            y: 900
            width: 200
            height: 200
            source: "human.png"
            state: "runLeft"
            states: [
                State {
                    name: "Right"
                    PropertyChanges {
                        target: human
                        x: 500
                    }
                },
                State {
                    name: "Left"
                    PropertyChanges {
                        target: human
                        x: 0
                    }
                }
            ]
            transitions: [
                Transition {
                    SequentialAnimation {
                        PropertyAnimation {
                            property: "x";
                            duration: 3000
                        }
                    }
                }
            ]
        }
    }
    Component.onCompleted: {
        pageStack.onDepthChanged.connect(pageCount)
    }

    function pageCount() {
        pages = pageStack.depth
        console.log(pages)
    }
}
