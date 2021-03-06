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
import "pages"
import "cover"

ApplicationWindow {
    id: app
    initialPage: Component { BrowsePage { } }
    cover: CoverPage {
        id: cover
        onSearchActionTriggered: {
            app.activate()
            // navigate to the first page, then search page
            while (pageStack.depth>1) {
                pageStack.navigateBack(PageStackAction.Immediate)
            }
            pageStack.push(Qt.resolvedUrl("pages/SearchPage.qml"), {}, PageStackAction.Immediate)
        }
    }
    allowedOrientations: defaultAllowedOrientations
}

