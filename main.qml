import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Chat Client")

    Connections {
        target: client
        function onNewMessage(ba) {
            listModelMessages.append({
                                         message: ba + ""
                                     })
        }
    }

    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.fillWidth: true
            TextField {
                id: textFieldIp
                placeholderText: qsTr("Server IP")
                Layout.fillWidth: true
                onAccepted: buttonConnect.clicked()
            }
            TextField {
                id: textFieldPort
                placeholderText: qsTr("Server port")
                Layout.fillWidth: true
                onAccepted: buttonConnect.clicked()
            }
            Button {
                id: buttonConnect
                text: qsTr("Connect")
                onClicked: client.connectToServer(textFieldIp.text, textFieldPort.text)
            }
        }
        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            model: ListModel {
                id: listModelMessages
                ListElement {
                    message: "Welcome to chat client"
                }
            }
            delegate: ItemDelegate {
                text: message
            }
            ScrollBar.vertical: ScrollBar {}
        }
        RowLayout {
            Layout.fillWidth: true
            TextField {
                id: textFieldMessage
                placeholderText: qsTr("Your message ...")
                Layout.fillWidth: true
                onAccepted: buttonSend.clicked()
            }
            Button {
                id: buttonSend
                text: qsTr("Send")
                onClicked: {
                    client.sendMessage(textFieldMessage.text)
                    textFieldMessage.clear()
                }
            }
        }
    }
}
