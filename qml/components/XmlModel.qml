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
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: indexXmlModel
    source: "../../data/images.xml"
    property string category
    property string searchString
    property string imageSubPath: "[@name='" + category + "']/image"
    property var subpath: ["",imageSubPath,imageSubPath]
    property string filterContains: ""
    property string basequery: "/root/topic" + subpath[pageStack.depth-1]
    query: basequery + filterContains

    XmlRole {
        name: "name"
        query: "@name/string()"
    }
    XmlRole {
        name: "author"
        query: "@author/string()"
    }
    XmlRole {
        name: "file"
        query: "@file/string()"
    }
//    XmlRole {
//        name: "topic"
//        query: "../@name/string()"
//    }

    function update() {
        filterContains = "[contains(@name,'" + searchString + "')]"
        reload()
        console.log("query: " + query)
    }
}
