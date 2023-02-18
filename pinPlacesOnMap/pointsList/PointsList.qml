import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtLocation 5.6
import QtPositioning 5.6
import QtQuick.Layouts 1.12
Item{
    width: parent.width*0.3
    height: parent.height
    property var listModel
    Rectangle{
        width: parent.width
        height: parent.height*0.075
        anchors.top: parent.top
        opacity: 0.9
        color: "#495254"
        Text {
            text: qsTr("Points List")
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: parent.width*0.15
            color: "white"
            font.bold: true
        }

    }

    Rectangle {
        width: parent.width
        height: parent.height*0.92
        anchors.bottom: parent.bottom
        color: "#495254"
        opacity: 0.9
        ListView {
            id:listView
            height: parent.height
            width: parent.width
            model: listModel
            clip: true


            delegate:Rectangle{
                id:mainrect
                width: listView.width
                height: 45
                color:"transparent"
                Row{
                    anchors.top: parent.top
                    width: parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: parent.height*0.45
                    Label{
                        text:"Lat : "
                        font.bold: true

                    }

                    Label {
                        id: missionNameTxt
                        font.bold: true
                        text: Math.round( model.coords.latitude*1000)/1000
                        color: "white"
                    }
                }
                Row{
                    anchors.bottom:  parent.bottom
                    width: parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: parent.height*0.45

                    Label{
                        text:"Lon : "
                        font.bold: true

                    }

                    Label {
                        text: Math.round( model.coords.longitude*1000)/1000
                        color: "white"
                        font.bold: true
                    }
                }

                Rectangle {
                    color: "white"
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                }

            }


        }

    }
}
