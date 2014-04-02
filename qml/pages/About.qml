/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
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
                //Short description goes here (maybe later)
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
