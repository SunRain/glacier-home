import QtQuick 2.0
//import QtQuick.Layouts 1.0
import Sailfish.Silica 1.0

Item {
    id: statusbarItem
    property alias source: icon.source
    property string panel_source
    property Component panel

    Image {
        id: icon
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (panel_source !== "" && !panel) {
                panel_loader.source = panel_source
                panel_loader.visible = !panel_loader.visible
            }
            if (panel && panel_source === "") {
                panel_loader.sourceComponent = panel
                panel_loader.visible = !panel_loader.visible
            }

            if (icon.source.toString().match("normal")) {
                icon.source = icon.source.toString().replace("normal","focused")
            } else {
                icon.source = icon.source.toString().replace("focused","normal")
            }
        }
    }
}
