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

import QtQuick 2.2
import Sailfish.Silica 1.0
import "../components"

Page {
    id: imgPage
    allowedOrientations: Orientation.All

    property alias signModel: slideView.model
    property alias currentIndex: slideView.currentIndex
    property var mod
    property int ind

    Drawer {
        id: signDrawer
        anchors.fill: parent
        dock: imgPage.isPortrait ? Dock.Top : Dock.Left
        open: true

        background: SilicaFlickable {
            anchors.fill: parent

            Column {
                id: column

                width: imgPage.width
                spacing: Theme.paddingLarge

                PageHeader {
                    title: signModel.get(currentIndex).name
                }
                Label {
                    x: Theme.paddingLarge
                    text: signModel.category ? qsTr("Category") + ": " + signModel.category : ""
                }
                Label {
                    x: Theme.paddingLarge
                    text: "© " + signModel.get(currentIndex).author
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.secondaryHighlightColor
                }
            }
        }

        foreground: SlideshowView {
            id: slideView
            anchors.fill: parent
            model: mod
            currentIndex: ind

            delegate: Image {
                id: signImage
                source: "../../data/" + file
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                onStatusChanged: {
                    if (signImage.status == Image.Ready) {
                        console.log(signImage.source + " loaded")
                    } else if (signImage.status == Image.Error) {
                        console.log(signImage.source + ": error loading image")
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: signDrawer.open = !signDrawer.open
                }
            }
        }
    }
}
