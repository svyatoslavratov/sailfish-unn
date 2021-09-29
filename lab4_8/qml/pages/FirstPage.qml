import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    ListModel {
        id: model
        ListElement {task: "Programming"; date: "1.09.2021"}
        ListElement {task: "Go to store"; date: "2.09.2021"}
        ListElement {task: "Read book"; date: "3.09.2021"}
        ListElement {task: "Go to UNN"; date: "4.09.2021"}
    }

    SlideshowView {
        anchors.centerIn: parent
        model: model
        delegate: Text {
            text: date + ":\n\n" + task
            color: "white"
            font.pixelSize: 72
        }
    }
}
