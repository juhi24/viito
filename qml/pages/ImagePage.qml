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

    SlideshowView {
        id: view
        anchors.fill: parent
        //interactive: count > 1

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
        }
    }
}
