# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-viito

CONFIG += sailfishapp

SOURCES += src/harbour-viito.cpp

DEPLOYMENT_PATH = /usr/share/$${TARGET}

# Data
data.files = data
data.path = $${DEPLOYMENT_PATH}
INSTALLS += data

OTHER_FILES += qml/harbour-viito.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-viito.spec \
    rpm/harbour-viito.yaml \
    harbour-viito.desktop \
    components/TopModel.qml \
    qml/pages/ImagePage.qml \
    qml/components/XmlModel.qml \
    qml/pages/SearchPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/BrowsePage.qml

