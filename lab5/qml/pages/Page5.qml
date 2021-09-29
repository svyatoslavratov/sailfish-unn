import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 6")
                onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
            }
        }

        XmlListModel {
            id: xmlListModel
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
        Component.onCompleted: loadNews()

        function loadNews() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', "http://www.cbr.ru/scripts/XML_daily.asp", true);
            xhr.onreadystatechange = function() {
                if(xhr.readyState === XMLHttpRequest.DONE){
                    xmlListModel.xml = xhr.responseText;
                }
            }
            xhr.send();
        }
    }
}
