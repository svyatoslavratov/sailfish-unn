import QtQuick 2.0
import Sailfish.Silica 1.0

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
            parent.state = states[nextIndex]
        }
    }
}
