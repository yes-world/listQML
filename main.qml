import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Контакты")

    ListModel {
        id: contactsModel
        ListElement {
            name: "Cаня"
            avatar: "icons/0.jpg"
            lastMessage: "Последнее сообщение Сани"
        }
        ListElement {
            name: "Анон"
            avatar: "icons/1.jpg"
            lastMessage: "Последнее сообщение, которое я оправил Анону"
        }
        ListElement {
            name: "Таня"
            avatar: "icons/2.jpg"
            lastMessage: "Стикер"
        }
    }

    ColumnLayout {
        anchors.fill: parent

        MainToolBar{
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.append({name: text})
            }
        }

        ContactList {
            id: list
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel
            onMenu: {
                contactListMenu.popup();
            }
        }
    }

    Menu {
        id: contactListMenu
        modal: true
        MenuItem {
            text: "Удалить"
            onTriggered: {
                contactsModel.remove(list.menuIndex);
            }
        }
    }
}
