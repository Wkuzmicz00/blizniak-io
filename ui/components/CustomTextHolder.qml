import QtQuick 2.15
import QtQuick.Controls 2.15

import qmlFiles

Item{
    width: 700
    height: 430
    id: textAreaHolder
    property string text: "test"

    Rectangle {
        id: rectangle
        anchors.fill: parent
        x: 0
        y: 0
        color: "transparent"
        border.color: "white"
        border.width: 3
        radius: 10
        property int charLimit: 1200

        TextArea {
            id: textArea
            width: 700
            height: 430
            font.pixelSize: 20
            placeholderTextColor: "white"
            color: "white"
            placeholderText: "DESCRIBE YOURSELF"
            padding: 10
            wrapMode: TextArea.Wrap

            onTextChanged: {
                if (text.length > rectangle.charLimit) {
                    text = text.slice(0, rectangle.charLimit);
                }
                textAreaHolder.text = text
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Tab) {
                        event.accepted = true;
                }
                if (text.length >= charLimit) {
                    if (event.key === Qt.Key_Backspace || event.key === Qt.Key_Delete) {
                        event.accepted = true;
                    } else {
                        event.accepted = false;  // Block all other keys
                    }
                    } else {
                        event.accepted = true;
                }
            }
        }
    }
}
