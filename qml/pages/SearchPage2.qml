import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page

    property string searchString

    SilicaListView {
        id: listView
        property alias searchField: listView.header

        anchors.fill: parent

        header: SearchField {
            id: field
            width: parent.width
            placeholderText: "Search"

            onTextChanged: {
                xmlModel.update()
                console.log(searchString)
            }
            Binding {
                target: page
                property: "searchString"
                value: field.text.toLowerCase().trim()
            }
        }

        // prevent newly added list delegates from stealing focus away from the search field
        currentIndex: -1

        model: XmlModel {
            id: xmlModel
            searchString: searchString
            query: "//image"

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
                    "selectedItem": name,
                    "author": author,
                    "file": file,
                    "model": listView.model,
                    "currentIndex": index
                }
                pageStack.push(Qt.resolvedUrl("ImagePage.qml"),props)
            }
        }

        VerticalScrollDecorator {}
    }
}
