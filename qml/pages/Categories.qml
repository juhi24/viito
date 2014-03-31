import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page
    property string selectedItem: "Categories"
    SilicaListView {
        id: listView
        model: XmlModel {
            itemName: selectedItem
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
            title: selectedItem
        }

        delegate: ListItem {
            id: delegate
            onClicked: {
                var props = {
                    "selectedItem": name,
                    "author": author,
                    "file": file
                }
                if (pageStack.depth == 1) {
                    pageStack.push(Qt.resolvedUrl("Categories.qml"),props)
                } else if (pageStack.depth == 2) {
                    pageStack.push(Qt.resolvedUrl("ImagePage.qml"),props)
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





