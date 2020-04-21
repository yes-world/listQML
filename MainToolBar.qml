import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

RowLayout {
    signal newItem(string text)

    TextField {
        id: textField
        Layout.fillWidth: true
        selectByMouse: true
    }

    function add() {
        newItem(textField.text)
        textField.clear()
    }

    Button {
        text: "Добавить"
        onClicked: {
            add()
        }
    }

    Keys.onReturnPressed: {
        add()
    }

    Keys.onEnterPressed: {
        add()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:300}
}
##^##*/
