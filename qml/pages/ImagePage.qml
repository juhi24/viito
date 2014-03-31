import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page

    property alias model: view.model
    property alias currentIndex: view.currentIndex
    property string selectedItem
    property string author
    property string file
    allowedOrientations: Orientation.All

    Drawer {
        id: drawer
        anchors.fill: parent
        dock: page.isPortrait ? Dock.Top : Dock.Left

        background: SilicaFlickable {
            anchors.fill: parent

            Column {
                id: column

                width: page.width
                spacing: Theme.paddingLarge

                PageHeader {
                    title: model.get(currentIndex).name
                }
                Label {
                    x: Theme.paddingLarge
                    text: "Category: " + model.category
                }
                Label {
                    x: Theme.paddingLarge
                    text: "© " + model.get(currentIndex).author
                }
            }
        }

        SlideshowView {
            id: view
            anchors.fill: parent

            delegate: Image {
                id: image
                source: "../../data/" + file
                width: view.width
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
