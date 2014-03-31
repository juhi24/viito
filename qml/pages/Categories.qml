import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
import "../components"

Page {
    id: page
    property string selectedItem
    SilicaListView {
        id: listView
        model: XmlListModel {
            id: xmlModel
            source: "../../data/images.xml"
            property var subpath: ["","[@name='" + page.selectedItem + "']/image"]
            query: "/root/topic" + subpath[pageStack.depth-1]

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
        }

        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: "Debug"
                onClicked: {
                    console.log(xmlModel.errorString())
                    console.log(xmlModel.query)
                }
            }
        }

        header: PageHeader {
            title: "Categories"
        }

        delegate: ListItem {
            id: delegate
            onClicked: {
                var props = {
                    "selectedItem": name
                }
                if (pageStack.depth == 1) {
                    pageStack.push(Qt.resolvedUrl("Categories.qml"),props)
                }
            }

            Label {
                id: label
                x: Theme.paddingLarge
                text: name
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
        }
        VerticalScrollDecorator { flickable: listView }
    }
}





