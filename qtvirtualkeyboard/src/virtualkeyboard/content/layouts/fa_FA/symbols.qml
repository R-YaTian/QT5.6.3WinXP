/******************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Virtual Keyboard module.
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
import QtQuick.Layouts 1.0
import QtQuick.Enterprise.VirtualKeyboard 2.0

KeyboardLayoutLoader {
    property bool secondPage
    onVisibleChanged: if (!visible) secondPage = false
    sourceComponent: secondPage ? page2 : page1
    Component {
        id: page1
        KeyboardLayout {
            keyWeight: 160
            KeyboardRow {
                Key {
                    text: "\u06F1"
                    alternativeKeys: "\u06F11"
                }
                Key {
                    text: "\u06F2"
                    alternativeKeys: "\u06F22"
                }
                Key {
                    text: "\u06F3"
                    alternativeKeys: "\u06F33"
                }
                Key {
                    text: "\u06F4"
                    alternativeKeys: "\u06F44"
                }
                Key {
                    text: "\u06F5"
                    alternativeKeys: "\u06F55"
                }
                Key {
                    text: "\u06F6"
                    alternativeKeys: "\u06F66"
                }
                Key {
                    text: "\u06F7"
                    alternativeKeys: "\u06F77"
                }
                Key {
                    text: "\u06F8"
                    alternativeKeys: "\u06F88"
                }
                Key {
                    text: "\u06F9"
                    alternativeKeys: "\u06F99"
                }
                Key {
                    text: "\u06F0"
                    alternativeKeys: "\u06F00"
                }
                BackspaceKey {}
            }
            KeyboardRow {
                FillerKey {
                    weight: 56
                }
                Key {
                    key: Qt.Key_At
                    text: "@"
                }
                Key {
                    key: Qt.Key_NumberSign
                    text: "#"
                }
                Key {
                    key:  Qt.Key_Percent
                    text: "%"
                }
                Key {
                    key: Qt.Key_Ampersand
                    text: "&"
                }
                Key {
                    key: Qt.Key_Asterisk
                    text: "*"
                }
                Key {
                    key: Qt.Key_Minus
                    text: "-"
                }
                Key {
                    key: Qt.Key_Plus
                    text: "+"
                }
                Key {
                    key: Qt.Key_ParenLeft
                    text: "("
                }
                Key {
                    key: Qt.Key_ParenRight
                    text: ")"
                }
                EnterKey {
                    weight: 283
                }
            }
            KeyboardRow {
                keyWeight: 156
                Key {
                    displayText: "1/2"
                    functionKey: true
                    onClicked: secondPage = !secondPage
                }
                Key {
                    key: Qt.Key_Exclam
                    text: "!"
                }
                Key {
                    key:  Qt.Key_QuoteDbl
                    text: '"'
                }
                Key {
                    key: Qt.Key_Less
                    text: "<"
                }
                Key {
                    key: Qt.Key_Greater
                    text: ">"
                }
                Key {
                    key: Qt.Key_Apostrophe
                    text: "'"
                }
                Key {
                    key: Qt.Key_Colon
                    text: ":"
                }
                Key {
                    key: 0x061B
                    text: "\u061B"
                    alternativeKeys: "\u061B;"
                }
                Key {
                    key: Qt.Key_Slash
                    text: "/"
                }
                Key {
                    key: 0x061F
                    text: "\u061F"
                    alternativeKeys: "\u061F?"
                }
                Key {
                    weight: 204
                    displayText: "1/2"
                    functionKey: true
                    onClicked: secondPage = !secondPage
                }
            }
            KeyboardRow {
                keyWeight: 154
                SymbolModeKey {
                    weight: 217
                    displayText: "\u0627\u200C\u0628\u200C\u067E"
                }
                ChangeLanguageKey {
                    weight: 154
                }
                SpaceKey {
                    weight: 864
                }
                Key {
                    key: Qt.Key_Period
                    text: "."
                    alternativeKeys: ".\u060C,"
                }
                Key {
                    key: 0xE000
                    text: ":-)"
                    alternativeKeys: [ ";-)", ":-)", ":-D", ":-(", "<3" ]
                }
                HideKeyboardKey {
                    weight: 204
                }
            }
        }
    }
    Component {
        id: page2
        KeyboardLayout {
            keyWeight: 160
            KeyboardRow {
                Key {
                    key: Qt.Key_AsciiTilde
                    text: "~"
                }
                Key {
                    key: Qt.Key_Agrave
                    text: "`"
                }
                Key {
                    key: Qt.Key_Bar
                    text: "|"
                }
                Key {
                    key: 0x7B
                    text: "·"
                }
                Key {
                    key: 0x221A
                    text: "√"
                }
                Key {
                    key: Qt.Key_division
                    text: "÷"
                }
                Key {
                    key: Qt.Key_multiply
                    text: "×"
                }
                Key {
                    key: Qt.Key_onehalf
                    text: "½"
                    alternativeKeys: "¼⅓½¾⅞"
                }
                Key {
                    key: Qt.Key_BraceLeft
                    text: "{"
                }
                Key {
                    key: Qt.Key_BraceRight
                    text: "}"
                }
                BackspaceKey {}
            }
            KeyboardRow {
                FillerKey {
                    weight: 56
                }
                Key {
                    key: 0xFDFC
                    text: "\uFDFC"
                }
                Key {
                    key: Qt.Key_Dollar
                    text: "$"
                }
                Key {
                    key: 0x20AC
                    text: "€"
                }
                Key {
                    key: 0xC2
                    text: "£"
                }
                Key {
                    key: 0xA2
                    text: "¢"
                }
                Key {
                    key: Qt.Key_Equal
                    text: "="
                }
                Key {
                    key: Qt.Key_section
                    text: "§"
                }
                Key {
                    key: Qt.Key_BracketLeft
                    text: "["
                }
                Key {
                    key: Qt.Key_BracketRight
                    text: "]"
                }
                EnterKey {
                    weight: 283
                }
            }
            KeyboardRow {
                keyWeight: 156
                Key {
                    displayText: "2/2"
                    functionKey: true
                    onClicked: secondPage = !secondPage
                }
                Key {
                    key: Qt.Key_Underscore
                    text: "_"
                }
                Key {
                    key: 0x2122
                    text: '™'
                }
                Key {
                    key: 0x00AE
                    text: '®'
                }
                Key {
                    key: Qt.Key_guillemotleft
                    text: '«'
                }
                Key {
                    key: Qt.Key_guillemotright
                    text: '»'
                }
                Key {
                    key: 0x201C
                    text: '“'
                }
                Key {
                    key: 0x201D
                    text: '”'
                }
                Key {
                    key: Qt.Key_Backslash
                    text: "\\"
                }
                Key {
                    key: Qt.Key_AsciiCircum
                    text: "^"
                }
                Key {
                    weight: 204
                    displayText: "2/2"
                    functionKey: true
                    onClicked: secondPage = !secondPage
                }
            }
            KeyboardRow {
                keyWeight: 154
                SymbolModeKey {
                    weight: 217
                    displayText: "\u0627\u200C\u0628\u200C\u067E"
                }
                ChangeLanguageKey {
                    weight: 154
                }
                SpaceKey {
                    weight: 864
                }
                Key {
                    key: 0x2026
                    text: "\u2026"
                }
                Key {
                    key: 0xE000
                    text: ":-)"
                    alternativeKeys: [ ";-)", ":-)", ":-D", ":-(", "<3" ]
                }
                HideKeyboardKey {
                    weight: 204
                }
            }
        }
    }
}