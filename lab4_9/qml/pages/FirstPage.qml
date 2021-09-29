import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

     SilicaListView {
         anchors.fill: parent
         PullDownMenu {
             MenuItem {
                 id: item1
                 text: "1'st  item"
                 onClicked: menuLabel.text = item1.text
             }
             MenuItem {
                 id: item2
                 text: "2'st item"
                 onClicked: menuLabel.text = item2.text
             }
             MenuItem {
                 id: item3
                 text: "3'st item"
                 onClicked: menuLabel.text = item3.text
             }
         }
         PushUpMenu  {
             id: pullDownMenu
             MenuLabel {id: menuLabel; text:""}
         }
     }
}

