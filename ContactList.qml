import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

ListView {
    id: list
    clip: true
    boundsBehavior: ListView.StopAtBounds
    ScrollBar.vertical: ScrollBar {}
    delegate: ContactItem {
        text: name
        icon: avatar
        message: lastMessage
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index
        }
    }
}
