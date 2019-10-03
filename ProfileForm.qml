import QtQuick 2.13
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.4
import QtQuick.Controls.Styles 1.4

Item {
    property alias name: firstName.text
    property alias surname: lastName.text
    property alias age: age.text
    property alias imageLink: avatar.text
    property alias info: aboutMe.text

    Text {
        text: 'Fill your personal info'
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        }

    GridLayout {
        rows: 5
        columns: 2
        rowSpacing: 20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 50

        ProfileField {
            id: firstName
            }

        Text {
            text: 'First Name'
            font.pixelSize: 15
            }


        ProfileField {
            id: lastName
            }

        Text {
            text: 'Last Name'
            font.pixelSize: 15
            }

        ProfileField {
            id: age
            }

        Text {
            text: 'Your age'
            font.pixelSize: 15
            }

        ProfileField {
            id: avatar
            }

        Text {
            text: 'Paste link to your avatar'
            font.pixelSize: 15
            }

        ProfileField {
            id: aboutMe
            height: 20
            }

        Text {
            text: 'Couple words about you'
            font.pixelSize: 15
             }
    }
}
