import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtLocation 5.6
import QtPositioning 5.6
import "./mainPageItems"
ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Pin Places On Map")

    Loader{
        anchors.fill: parent
        sourceComponent: mainPage
    }
    Component{
        id:mainPage
        MainPage{

        }
    }

}
