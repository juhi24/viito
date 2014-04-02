/*
    Viito is an illustrated Finnish to Finnish sign language dictionary
    Copyright (C) 2014 Jussi Tiira

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see http://www.gnu.org/licenses/.
*/

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
                    text: model.category ? qsTr("Category") + ": " + model.category : ""
                }
                Label {
                    x: Theme.paddingLarge
                    text: "© " + model.get(currentIndex).author
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.secondaryHighlightColor
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
