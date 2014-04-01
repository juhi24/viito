import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: xmlModel
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

    function update() {
        filterContains = "[contains(@name,'" + searchString + "')]"
        reload()
        console.log("query: " + query)
    }
}
