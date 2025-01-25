import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle
    width: 500
    height: 300
    color: "transparent"

    Text {
        id: animatedText
        text: "GENIMAL"
        font.letterSpacing: 0.6
        color: "white"
        font.pixelSize: 75
        lineHeight: 1
        font.wordSpacing: 0.7
        font.bold: true
        anchors.centerIn: parent
    }


}
