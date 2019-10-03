import QtQuick 2.13
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2


Window {
    property alias first_name: name
    property alias last_name: surname
    property alias about: info
    property alias age: age
    property alias image: avatar

    signal signalExit
    minimumWidth:480
    minimumHeight:600
    maximumWidth:480
    maximumHeight:600

    Text {
       text: 'Hello, '+name.text+'!'
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.top: parent.top
       anchors.topMargin: 50
       font.pixelSize: 30
        }

    Rectangle {
        id: rect
        width: 400
        height: 300
        anchors.centerIn: parent

        GridLayout {
            anchors.fill: parent
            rows: 5
            columns: 2

            Rectangle {
                Layout.fillHeight: false
                Layout.fillWidth: true
                height: 100
                color: 'white'
                Layout.row: 1
                Layout.column: 1
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: false
                width: 150
                Layout.row: 1
                Layout.column: 2
                Image {
                    id: avatar
                    anchors.fill: parent
                    sourceSize.width: 1024
                    sourceSize.height: 1024
                    }
                }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 2
                Layout.column: 1
                Text {
                    id: age
                    font.pixelSize: 20
                }
             }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 3
                Layout.column: 1
                Text {
                    text: 'First Name'
                    font.pixelSize: 16
                    }
             }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 3
                Layout.column: 2
                Text {
                    id: name
                    font.pixelSize: 20
                    }
             }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 4
                Layout.column: 1
                Text {
                    text: 'Last Name'
                    font.pixelSize: 16
                    }
            }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 4
                Layout.column: 2
                Text {
                    id: surname
                    font.pixelSize: 20
                    }
             }
            Rectangle {
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 5
                Layout.column: 1
                Text {
                    id: about
                    text: 'About Me'
                    font.pixelSize: 16
                    }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 5
                Layout.column: 2
                Text {
                    id: info
                    font.pixelSize: 20
                }
            }
        }
     }


    // Кнопка для открытия главного окна приложения
    Button {
        text: "Back to edit profile"
        width: 180
        height: 50
        anchors.top: rect.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
           signalExit() // Вызываем сигнал
        }
    }
}