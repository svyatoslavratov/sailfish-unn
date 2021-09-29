import QtQuick 2.0
import Sailfish.Silica 1.0
import Request 1.0

Page {
id: page
allowedOrientations: Orientation.All

Request {
    id: request
    onImageChanged: image.source = request.getImage()
    onRespondChanged: label.text = request.getRespond()

}

Column {
    width: parent.width
    height: parent.height
    spacing: 15
    Label {
        id: label
        font.pixelSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "GET-request"
        onClicked: {
            request.sendGetRequest();
        }
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "POST Body:"
    }
    TextField {
        id: textField
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "POST-request"
        onClicked: {
            request.sendPostRequest(textField.text);
        }
    }
    Image {
        width: 150
        height: 150
        anchors.horizontalCenter: parent.horizontalCenter
        id: image
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Get image"
        onClicked: {
            request.sendImageRequest();
        }
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "PUT Body:"
    }
    TextField {
        id: textField2
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "PUT-request"
        onClicked: {
            request.sendPutRequest(textField2.text);
        }
    }
}
}
