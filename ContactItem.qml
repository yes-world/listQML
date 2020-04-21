import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: labelName.text
    property string message: "Здесь должно быть последнее сообщение"    //в моем представлении сюда передается текст последнего сообщения
    property bool selected: false

    signal leftClick()
    signal rightClick()

    width: parent.width
    height: 60
    color: {
        if (selected) {
            return "lightblue"
        }
        if (area.containsMouse) {
            return "#f1f1f1"
        }
        return "white"
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 7

        /*Закругление картинки. Это самая простая, но очень медленная реализация.
          Находил несколько способов, но понял только этот. Написано, что при большом кол-ве
          элементов будет лагать, и что с такой реализацией нельзя выпускать приложение.*/
        Rectangle { //Для позтционирования всей конструкции выбрал rectangle
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 8
            color: "transparent"    //прозрачный

            Image {
                id: icon
                fillMode: Image.PreserveAspectCrop  //заполнение по высоте
                anchors.fill: parent    //размер как у rectangle
                visible: false  //видимость включает OpacityMask
            }

            Rectangle { //эту форму примет картинка
                id: mask
                anchors.fill: parent    //размер как у rectangle
                radius: 0.5 * height    //круг
                visible: false  //видимость включает OpacityMask
            }

            OpacityMask {   //элемент который делает картунку форму как у rectangle маски
                anchors.fill: parent
                source: icon
                maskSource: mask
            }
        }

        ColumnLayout {  //имя и сообщение под ним расположены в колонку
            spacing: 0

            Label { //имя
                id: labelName
                Layout.fillWidth: true
                color: "black"
            }

            Label { //сообщение
                Layout.fillWidth: true
                color: "gray"
                text: me.message
                elide: Text.ElideRight  //длинные сообщения урезаются
            }
        }

        Image { //просто чтобы было похоже на инстаграмм, никакого практического приенения у меня нет
            fillMode: Image.PreserveAspectFit
            source: "icons/camera.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 20
        }
    }

    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                leftClick();
            }
            if (mouse.button === Qt.RightButton) {
                rightClick();
            }
        }
    }
}
