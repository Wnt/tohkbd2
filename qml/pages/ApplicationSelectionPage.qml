import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    id: page

    signal selected(string filePath)

    SilicaGridView
    {
        id: gridView

        anchors.fill: parent
        cellWidth: page.width / 4
        cellHeight: Screen.height / 6
        header: Item
        {
            height: Screen.height / 6
            width: page.width
            PageHeader
            {
                //% "Applications"
                title: qsTrId("settings-he-applications")
            }
        }

        model: applicationsModel

        delegate: Rectangle
        {
            id: appItem
            color: "Transparent"

            width: gridView.cellWidth
            height: gridView.cellHeight
            Image
            {
                id: appIcon
                source: iconId
                y: Math.round((parent.height - (height + appTitle.height)) / 2)
                anchors.horizontalCenter: parent.horizontalCenter
                property real size: Theme.iconSizeLauncher

                sourceSize.width: size
                sourceSize.height: size
                width: size
                height: size

            }

            Label
            {
                id: appTitle
                text: name
                anchors
                {
                    top: appIcon.bottom
                    topMargin: Theme.paddingSmall
                    left: parent.left
                    right: parent.right
                }
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: Theme.fontSizeTiny
                elide: Text.ElideRight
                color: Theme.primaryColor
            }

            BackgroundItem
            {
                anchors.fill: parent
                onClicked:
                {
                    selected(filePath)
                    pageStack.pop()
                }

            }

        }
    }
}

