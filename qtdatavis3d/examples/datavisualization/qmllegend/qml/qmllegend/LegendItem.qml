/******************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Data Visualization module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Window 2.1
import QtDataVisualization 1.0

Rectangle {
    //! [0]
    property Theme3D theme
    property Bar3DSeries series
    //! [0]
    property point previousSelection

    id: legendItem
    state: "unselected"

    // Workaround for a layout bug that in some situations causes changing from fully opaque color
    // to a transparent one to use black background instead of what is actually under the items.
    // Having the control always slighthly transparent forces the background to be refreshed
    // properly.
    opacity: 0.999

    //! [1]
    RowLayout {
        anchors.fill: parent
        spacing: 0
        clip: true
        Item {
            id: markerSpace
            Layout.minimumWidth: 20
            Layout.minimumHeight: 20
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter
            Rectangle {
                x: parent.x + parent.width / 4
                y: parent.y + parent.height / 4
                width: parent.width / 2
                height: width
                border.color: "black"
                color: series.baseColor
            }
        }
        Item {
            height: markerSpace.height
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter
            Layout.minimumWidth: 100
            Text {
                anchors.fill: parent
                text: series.name
                verticalAlignment: Text.AlignVCenter
                clip: true
                color: theme.labelTextColor
                font: theme.font
            }
        }
    }
    //! [1]

    //! [2]
    MouseArea {
        id: mouseArea
        anchors.fill: legendItem
        onClicked: {
            if (legendItem.state === "selected") {
                series.selectedBar = series.invalidSelectionPosition
            } else {
                series.selectedBar = previousSelection
            }
        }
    }
    //! [2]

    //! [4]
    Connections {
        target: series
        onSelectedBarChanged: {
            if (position != series.invalidSelectionPosition) {
                previousSelection = position
            }
        }
    }
    //! [4]

    //! [3]
    states: [
        State  {
            name: "selected"
            when: series.selectedBar != series.invalidSelectionPosition
            PropertyChanges {
                target: legendItem
                color: series.singleHighlightColor
            }
        },
        State  {
            name: "unselected"
            when: series.selectedBar == series.invalidSelectionPosition
            PropertyChanges {
                target: legendItem
                color: theme.labelBackgroundColor
            }
        }
    ]
    //! [3]
}
