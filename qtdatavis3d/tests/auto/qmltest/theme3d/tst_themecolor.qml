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

import QtQuick 2.0
import QtDataVisualization 1.2
import QtTest 1.0

Item {
    id: top
    width: 150
    height: 150

    ThemeColor {
        id: initial
    }

    ThemeColor {
        id: initialized
        color: "red"
    }

    ThemeColor {
        id: change
    }

    TestCase {
        name: "ThemeColor Initial"

        function test_initial() {
            compare(initial.color, "#000000")
        }
    }

    TestCase {
        name: "ThemeColor Initialized"

        function test_initialized() {
            compare(initialized.color, "#ff0000")
        }
    }

    TestCase {
        name: "ThemeColor Change"

        function test_change() {
            change.color = "blue"

            compare(change.color, "#0000ff")
        }
    }
}
