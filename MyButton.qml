import QtQuick 2.13
import QtQuick.Controls 1.4


Button {
    width: 180
    height: 50
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30
    anchors.horizontalCenter: parent.horizontalCenter
    text: "Yes"
     onClicked: {
        user_profile.create(profile.name, profile.surname, profile.age, profile.imageLink, profile.info)
        user_profile.set_open()
        console.log(profile.name)
    }
}
