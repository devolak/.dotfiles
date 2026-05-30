import QtQuick
import qs.Common

Rectangle {
  id: root

  property date liveTime
  property int selectedDay
  property int selectedMonth
  property int selectedYear

  property bool isWindowVisible: true

  width: 230
  radius: 28
  color: Color.moduleBackground
  clip: true

  Item {
    anchors.fill: parent

    // Animated Background Blobs
    Item {
      anchors.centerIn: parent
      anchors.verticalCenterOffset: -40

      Rectangle {
        width: 160
        height: 140
        radius: 75
        color: Color.buttonFocusedBackground
        opacity: 0.12
        x: -80
        y: -70
        transformOrigin: Item.Center

        SequentialAnimation on x {
          loops: Animation.Infinite
          paused: !root.isWindowVisible // Stops when hidden
          NumberAnimation {
            to: -30
            duration: 8000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -110
            duration: 9500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -60
            duration: 7500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -80
            duration: 8500
            easing.type: Easing.InOutSine
          }
        }
        SequentialAnimation on y {
          loops: Animation.Infinite
          paused: !root.isWindowVisible
          NumberAnimation {
            to: -110
            duration: 9000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -30
            duration: 8500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -85
            duration: 9500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -70
            duration: 8000
            easing.type: Easing.InOutSine
          }
        }
        NumberAnimation on rotation {
          from: 0
          to: 360
          duration: 24000
          loops: Animation.Infinite
          paused: !root.isWindowVisible
        }
      }
    }

    Item {
      anchors.centerIn: parent
      anchors.verticalCenterOffset: 60

      Rectangle {
        width: 140
        height: 160
        radius: 75
        color: Color.buttonHoverBackground
        opacity: 0.14
        x: -70
        y: -80
        transformOrigin: Item.Center

        SequentialAnimation on x {
          loops: Animation.Infinite
          paused: !root.isWindowVisible
          NumberAnimation {
            to: -30
            duration: 9000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -100
            duration: 8500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -50
            duration: 10000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -70
            duration: 9500
            easing.type: Easing.InOutSine
          }
        }
        SequentialAnimation on y {
          loops: Animation.Infinite
          paused: !root.isWindowVisible
          NumberAnimation {
            to: -40
            duration: 10000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -110
            duration: 9000
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -60
            duration: 8500
            easing.type: Easing.InOutSine
          }
          NumberAnimation {
            to: -80
            duration: 9000
            easing.type: Easing.InOutSine
          }
        }
        NumberAnimation on rotation {
          from: 360
          to: 0
          duration: 28000
          loops: Animation.Infinite
          paused: !root.isWindowVisible
        }
      }
    }
  }

  Column {
    anchors.centerIn: parent
    spacing: 40

    Column {
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: -22

      Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatTime(root.liveTime, "hh")
        color: Color.moduleText
        font.family: Style.barFontFamily
        font.pointSize: 88
        font.weight: Font.Black
      }
      Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatTime(root.liveTime, "mm")
        color: Color.moduleText
        font.family: Style.barFontFamily
        font.pointSize: 88
        font.weight: Font.Bold
      }
    }

    Column {
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: 4

      Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDate(new Date(root.selectedYear, root.selectedMonth, root.selectedDay), "dddd")
        color: Color.moduleText
        font.family: Style.barFontFamily
        font.pointSize: 18
        font.weight: Font.Bold
      }
      Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDate(new Date(root.selectedYear, root.selectedMonth, root.selectedDay), "MMMM d, yyyy")
        color: Color.moduleText
        font.family: Style.barFontFamily
        font.pointSize: 13
        font.weight: Font.Medium
      }
    }
  }
}
