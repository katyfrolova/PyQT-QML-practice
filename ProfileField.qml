import QtQuick 2.13
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.4
import QtQuick.Controls.Styles 1.4

TextField {
    Layout.fillWidth: true
    horizontalAlignment: Text.AlignHCenter
    style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 15
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        }