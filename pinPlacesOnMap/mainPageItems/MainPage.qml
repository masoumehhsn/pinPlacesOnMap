import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtLocation 5.6
import QtPositioning 5.6
import "../pointsList"
Item {
    property bool listVisible: false
    Map {
        id:map
        anchors.fill: parent
        plugin: mapPlugin
        zoomLevel: 10
        ListModel{
            id: pointsModel
        }
        MapItemView{
            id:mapPoint
            model: pointsModel

            delegate: MapQuickItem{
                anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
                coordinate: QtPositioning.coordinate(model.coords.latitude, model.coords.longitude)
                sourceItem: Image {
                    source: "qrc:/res/images/icons/polygonPoint.svg"
                    width: 30
                    height: 40
                    MouseArea{
                        anchors.fill: parent
                        propagateComposedEvents: true
                        onPressed: {
                            currentIndex = index
                            mouse.accepted = false
                        }
                    }
                }
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                var point = Qt.point(mouse.x, mouse.y)
                var coord = map.toCoordinate(point);
                addMapMarker(coord)

            }
        }//                        font.pixelSize: parent.width*0.06


        PointsList{
            id:pointsList
            anchors.verticalCenter: parent.verticalCenter
            x: -width
            listModel: pointsModel
        }
        RoundButton{
            id:moveListBtn
            anchors.left: parent.left
            anchors.top: parent.top
            Material.elevation: 0
            icon.source: "qrc:/res/images/icons/arrowRight.svg"

            Material.foreground: "#303030"
            onClicked: {
                listVisible = !listVisible
                showListAnim.start()
            }

        }
        PropertyAnimation{
            id:showListAnim
            target:pointsList ; property: "x";to:listVisible?0:-pointsList.width ; duration: 600
            onStopped: {
                moveListBtn.icon.source = listVisible?"qrc:/res/images/icons/arrowLeft.svg":"qrc:/res/images/icons/arrowRight.svg"
            }

        }

    }
    Plugin {
        id: mapPlugin
        name: "googlemaps" // "mapboxgl", "esri", ...

    }
    PositionSource{
        id: positionSource
        active: true

        onPositionChanged: {
            map.center = positionSource.position.coordinate
        }
    }
    function addMapMarker(coordinate){
        pointsModel.append({"coords": coordinate})

    }


}
