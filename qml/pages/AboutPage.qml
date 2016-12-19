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


Page {
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: mainColumn.height + Theme.paddingLarge + buttonsColumn.height
        Column {
            id: mainColumn
            spacing: Theme.paddingMedium
            anchors.left: parent.left; anchors.leftMargin: Theme.paddingMedium
            anchors.right: parent.right; anchors.rightMargin: Theme.paddingMedium
            PageHeader {
                title: qsTr("About")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.width: 240; sourceSize.height: 240
                fillMode: Image.PreserveAspectFit
                source: "../../data/harbour-viito.svg"
            }

            Column {
                anchors.left: parent.left; anchors.right: parent.right
                spacing: Theme.paddingSmall
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: Theme.fontSizeHuge
                    text: "Viito"
                }
                //TODO: Version info here
            }

            Label {
                wrapMode: Text.WordWrap
                anchors.left: parent.left; anchors.right: parent.right
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("To Ki-Ri who inspired me to learn Finnish sign language.")
            }
            Label {
                wrapMode: Text.WordWrap
                anchors.left: parent.left; anchors.right: parent.right
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("Viito is an open source illustrated dictionary for Finnish sign language written by Jussi Tiira. The app is heavily inspired by and a tribute to Viito for Maemo 5 by Aki Niemi.")
            }
            Label {
                wrapMode: Text.WordWrap
                anchors.left: parent.left; anchors.right: parent.right
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.secondaryHighlightColor
                text: qsTr("The illustrations used in this application are drawn by Elina Vanninen and Kalevi Puistolinna. They are available under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license and can be found on <a href=\"http://papunet.net/materiaalia/kuvapankki\">Papunet image collection</a>. ")
            }
        }

        Column {
            id: buttonsColumn
            anchors.top: mainColumn.bottom; anchors.topMargin: Theme.paddingLarge
            anchors.left: parent.left; anchors.right: parent.right

            //            BackgroundItem {
            //                anchors.left: parent.left; anchors.right: parent.right
            //                onClicked: pageStack.push(Qt.resolvedUrl("ChangeLogPage.qml"))
            //                Label {
            //                    anchors.left: parent.left; anchors.leftMargin: Theme.paddingMedium
            //                    anchors.right: parent.right; anchors.rightMargin: Theme.paddingMedium
            //                    anchors.verticalCenter: parent.verticalCenter
            //                    //: Caption of a button that leads to the changelog
            //                    text: qsTr("Changelog")
            //                }
            //            }
        }

        VerticalScrollDecorator {}
    }
}
