import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page

    property string selectedItem
    property string author
    property string file
    allowedOrientations: Orientation.All

    Drawer {
        id: drawer
        anchors.fill: parent
        dock: page.isPortrait ? Dock.Top : Dock.Left

        open: true

        background: SilicaFlickable {
            anchors.fill: parent

            Image {
                id: testimg
                source: "../../data/images/8ac3c4047c7ad3c753ee06d467f3f197"
            }
            Button {
                text: "Debug"
                onClicked: {
                    drawer.hide()
                }
            }
        }

        SlideshowView {
            id: view
            anchors.fill: parent
            interactive: count > 1

            model: XmlModel {
                itemName: selectedItem
            }

            delegate: Image {
                id: image
                source: "../../data/" + file
                width: page.isPortrait ? Screen.width : Screen.height
                height: view.height
                fillMode: Image.PreserveAspectFit
                onStatusChanged: {
                    if (image.status == Image.Ready) {
                        console.log(image.source + " loaded")
                    } else if (image.status == Image.Error) {
                        console.log(image.source + ": error loading image")
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: drawer.open = !drawer.open
                }
            }
        }
    }
}
