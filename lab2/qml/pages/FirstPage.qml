import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.

        Item {
            x: 200; y: 25
            Rectangle {
                id: redRect
                width: 100
                height: 100
                color: "#FF0000"
            }
            Rectangle {
                id: greenRect
                width: 100
                height: 100
                color: "#00FF00"
                anchors.left: redRect.right
                anchors.top: redRect.verticalCenter
            }
            Rectangle {
                id: blueRect
                width: 100
                height: 100
                color: "#0000FF"
                anchors.left: greenRect.horizontalCenter
                anchors.bottom: greenRect.verticalCenter
            }
            Text {
                text: "Square"
                font.family:"Helvetica"
                font.pointSize: 15
                color:"white"
                anchors.centerIn: blueRect
            }
        }

        Column {
            id: column
            x: 200; y: 200
            width: page.width
            spacing: Theme.paddingLarge

            Column {
                spacing: 15
                Row {
                    spacing: 15
                    Rectangle {width: 100; height: 100; color: "#FF0000"}
                    Rectangle {width: 100; height: 100; color: "#00FF00"}
                    Rectangle {width: 100; height: 100; color: "#0000FF"}
                }
                Row {
                    spacing: 130
                    Rectangle {width: 100; height: 100; color: "#FF00FF"}
                    Rectangle {width: 100; height: 100; color: "#000000"}
                }
            }
            Grid{
                id: grid
                columns: 3
                rows: 2
                spacing: 15
                Rectangle {width: 100; height: 100; color: "#FF0000"}
                Rectangle {width: 100; height: 100; color: "#00FF00"}
                Rectangle {width: 100; height: 100; color: "#0000FF"}
                Rectangle {width: 100; height: 100; color: "#FF00FF"}
                Rectangle {opacity: 0; width: 100; height: 100; color: "#000000"}
                Rectangle {width: 100; height: 100; color: "#000000"}
            }
            Rectangle {
                id: square
                width: 100;
                height: 100;
                color: "#000000"
            }
            Rectangle {
                width: 100;
                height: 100;
                color: "#000000"
                transform:  [
                Scale {yScale: 0.5},
                Rotation {angle: 315},
                Translate {x:115; y: -50  }
                ]
            }
            Rectangle {
                id:animRect
                width: 100;
                height: 100;
                color: "#00FF00"
                ParallelAnimation {
                    id:anim
                    loops: Animation.Infinite
                    running: true
                    PropertyAnimation {
                        target:animRect
                        properties: "scale"
                        from: 1
                        to: 1.5
                        duration: 2000
                        running: true
                    }
                    PropertyAnimation{
                        target:animRect
                        property: "y"
                        from: 625
                        to: 750
                        duration: 2000
                        running: true
                    }
                }
            }
            Button {
                text: "Open dialog"
                onClicked: pageStack.push(dialog)
                transform: Translate {id:translate; y: 75}
            }
        }
    }
    Dialog {
        id: dialog
        DialogHeader {
            title: "Sum number"
        }
        TextField {
            placeholderText: "1'st number"
            id: firstTextField
            width: parent.width / 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
        }
        TextField {
            placeholderText: "2'd number"
            id: secondTextField
            width: parent.width / 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: firstTextField.right
        }
        onAccepted: console.log(parseInt(firstTextField.text) + parseInt(secondTextField.text))
    }
}

