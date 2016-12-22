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
    allowedOrientations: Orientation.All

    property string searchString
    onSearchStringChanged: {
        searchXmlModel.searchString = searchString
        searchXmlModel.update()
    }

    SilicaListView {
        id: searchListView

        anchors.fill: parent

        header: Column{
            id: headerContainer
            width: page.width

            PageHeader {
                title: qsTr("All categories")
            }

            SearchField {
                id: field
                width: parent.width
                placeholderText: qsTr("Search")

                Binding {
                    target: page
                    property: "searchString"
                    value: field.text.toLowerCase().trim()
                }
            }
        }

        // prevent newly added list delegates from stealing focus away from the search field
        currentIndex: -1

        model: XmlModel {
            id: searchXmlModel
            basequery: "//image"

            Component.onCompleted: update()
        }

        delegate: ListItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                color: searchString.length > 0 ? (highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor)
                                               : (highlighted ? Theme.highlightColor : Theme.primaryColor)
                textFormat: Text.StyledText
                text: Theme.highlightText(model.name, searchString, Theme.highlightColor)
            }
            onClicked: {
                var props = {
                    "signModel": searchXmlModel,
                    "ind": index
                }
                pageStack.push(Qt.resolvedUrl("ImagePage.qml"),props)
            }
        }
        VerticalScrollDecorator {}
    }
}
