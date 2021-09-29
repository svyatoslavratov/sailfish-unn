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

    SilicaListView {
        anchors.fill: parent
        model: model
        header: PageHeader {title: "Task"}
        section {
            property:'date'
            delegate: SectionHeader {text: section}
        }
        delegate: Text {
            text: task
            color: "white"
        }
    }
}

