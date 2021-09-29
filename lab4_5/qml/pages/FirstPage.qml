import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    Column {
        y: 400
        width: parent.width
        spacing: Theme.paddingMedium
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Open dialog"
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog", {hour: 12, minute: 0})
                dialog.accepted.connect(function() {label.text = dialog.timeText})
            }
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            id: label
        }
    }
}
