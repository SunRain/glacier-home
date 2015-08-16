import QtQuick 2.0

Image {
    id: lockScreen
    source: "qrc:/images/graphics-wallpaper-home.jpg"
    visible: LipstickSettings.lockscreenVisible || deviceLock.state === 1

    LockscreenClock {
        id: clock
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
    DeviceLock {
        id: deviceLockUI
        anchors.fill: parent
        visible: deviceLock.state === 1
        z: 201
    }

    MouseArea {
        anchors.fill: parent
    }
}

