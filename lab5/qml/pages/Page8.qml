import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: setting
        path: "/apps/app_name/settings"
        property string text: ""
        property bool flag: false
    }
    Column {
        width: parent.width
        height: parent.height
        spacing: 30

        TextField {
            id: textField
        }
        Switch {
            id: switch1
        }
        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Save"
            onClicked:
            {
                setting.text = textField.text
                setting.flag = switch1.data
            }
        }
    }
}
