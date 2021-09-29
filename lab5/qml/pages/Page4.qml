import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 5")
                onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
            }
        }

        XmlListModel {
            id: xmlListModel
            source: "http://www.cbr.ru/scripts/XML_daily.asp"
            query: "/ValCurs/Valute"
            XmlRole { name:"Name"; query: "Name/string()"}
            XmlRole { name:"Value"; query: "Value/string()"}
       }


        SilicaListView {
            anchors.fill: parent
            header: PageHeader {title: "Civility"}
            model: xmlListModel
            spacing: 10
            delegate: Column {
                    x:10; width: parent.width - 2*x
                    Label {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: Name
                    }
                    Label {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: Value
                    }
            }
        }
    }
}
