import QtQuick 2.0
import Sailfish.Silica 1.0

Button {
    default property var someText
    property color someColor: "green"
    text: someText.text
    color: someColor
}
