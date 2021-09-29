import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    anchors.horizontalCenter: parent.horizontalCenter
    property var hours: 0
    property var minutes: 0
    property var seconds: 0
    text: hours + ":" + minutes + ":" + seconds
    font.pixelSize: 80
    Timer {
        id: timer
        interval: 1000
        repeat: true
        running:false
        onTriggered:  {
            parent.seconds++;
            if(parent.seconds === 60)
                minutes++;
            if(parent.minutes === 60)
                hours++;
        }
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        text: "Start / Stop"
        onClicked: {
            if(timer.running === true)
                timer.running = false
            else
                timer.running = true
        }
    }
}
