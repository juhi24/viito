import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page

    property string searchString

    onSearchStringChanged: xmlModel.update()
    Component.onCompleted: xmlModel.update()

    Column {
        id: headerContainer

        width: page.width

        PageHeader {
            title: "All categories"
        }

        SearchField {
            id: searchField
            width: parent.width

            Binding {
                target: page
                property: "searchString"
                value: searchField.text.toLowerCase().trim()
            }
        }
    }

    Component {
        id: listViewComponent
        SilicaListView {
            id: view
            model: XmlModel {
                id: xmlModel
                searchString: searchField.text
                query: "//image"
            }
            anchors.fill: parent
            currentIndex: -1 // otherwise currentItem will steal focus

            header: {
                id: header
                width: headerContainer.width
                height: headerContainer.height
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
                onClicked: pageStack.push()
            }

            VerticalScrollDecorator {}
        }
    }
}
