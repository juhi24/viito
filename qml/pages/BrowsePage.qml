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
import QtQuick.XmlListModel 2.0
import "../components"

Page {
    id: menuPage
    allowedOrientations: Orientation.All
    property string selectedItem: qsTr("Categories")

    BusyIndicator {
        anchors.centerIn: parent
        size: BusyIndicatorSize.Large
        running: menuIndexModel.status === XmlListModel.Loading
    }

    SilicaListView {
        // Handle lists of categories and words.
        id: wordListView
        model: XmlModel {
            id: menuIndexModel
            category: selectedItem
        }

        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: "Search"
                onClicked: pageStack.push(Qt.resolvedUrl("SearchPage.qml"))
            }
        }

        header: PageHeader {
            title: selectedItem
        }

        delegate: ListItem {
            id: wordListDelegate
            onClicked: {
                if (pageStack.depth == 1) {
                    pageStack.push(Qt.resolvedUrl("BrowsePage.qml"),{"selectedItem": name})
                } else if (pageStack.depth == 2) {
                    var props = {
                        "signModel": menuIndexModel,
                        "ind": index
                    }
                    pageStack.push(Qt.resolvedUrl("ImagePage.qml"),props)
                }
            }

            Label {
                id: wordLabel
                x: Theme.paddingLarge
                text: name
                anchors.verticalCenter: parent.verticalCenter
                color: wordListDelegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
        }
        VerticalScrollDecorator { flickable: wordListView }
    }
}





