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
        icon: "icons/" + index % 9 + ".jpg" //всего 8 картинок, и они будут повторяться по кругу
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index
        }
    }
}
