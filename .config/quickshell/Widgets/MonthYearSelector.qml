import QtQuick
import qs.Common

Item {
  id: root

  property int displayYear
  property int displayMonth

  signal previousYear
  signal nextYear
  signal monthSelected(int monthIndex)

  Column {
    anchors.centerIn: parent
    spacing: 32

    Row {
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: 24

      Rectangle {
        width: 40
        height: 40
        radius: 20
        color: yearPrevMouse.containsMouse ? Color.moduleBackground : "transparent"
        scale: yearPrevMouse.pressed ? 0.9 : (yearPrevMouse.containsMouse ? 1.1 : 1.0)

        Behavior on scale {
          NumberAnimation {
            duration: 150
            easing.type: Easing.OutBack
            easing.overshoot: 1.1
          }
        }

        Text {
          anchors.centerIn: parent
          text: "❮"
          color: Color.moduleText
          font.pointSize: 14
          font.family: Style.barFontFamily
        }
        MouseArea {
          id: yearPrevMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: root.previousYear()
        }
      }

      Text {
        anchors.verticalCenter: parent.verticalCenter
        text: root.displayYear.toString()
        color: Color.moduleText
        font.family: Style.barFontFamily
        font.pointSize: 22
        font.weight: Font.Bold
      }

      Rectangle {
        width: 40
        height: 40
        radius: 20
        color: yearNextMouse.containsMouse ? Color.moduleBackground : "transparent"
        scale: yearNextMouse.pressed ? 0.9 : (yearNextMouse.containsMouse ? 1.1 : 1.0)

        Behavior on scale {
          NumberAnimation {
            duration: 150
            easing.type: Easing.OutBack
            easing.overshoot: 1.1
          }
        }

        Text {
          anchors.centerIn: parent
          text: "❯"
          color: Color.moduleText
          font.pointSize: 14
          font.family: Style.barFontFamily
        }
        MouseArea {
          id: yearNextMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: root.nextYear()
        }
      }
    }

    Item {
      width: monthGrid.implicitWidth
      height: monthGrid.implicitHeight
      anchors.horizontalCenter: parent.horizontalCenter

      // Sliding Pill
      Rectangle {
        width: 76
        height: 48
        radius: 24
        color: Color.buttonHoverBackground
        x: (root.displayMonth % 4) * 88
        y: Math.floor(root.displayMonth / 4) * 60

        Behavior on x {
          NumberAnimation {
            duration: 250
            easing.type: Easing.OutBack
            easing.overshoot: 1.1
          }
        }
        Behavior on y {
          NumberAnimation {
            duration: 250
            easing.type: Easing.OutBack
            easing.overshoot: 1.1
          }
        }
      }

      Grid {
        id: monthGrid
        columns: 4
        spacing: 12

        Repeater {
          model: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
          Rectangle {
            width: 76
            height: 48
            radius: 24
            readonly property bool isSelectedMonth: index === root.displayMonth
            color: monthMouse.containsMouse && !isSelectedMonth ? Color.buttonActiveBackground : "transparent"
            scale: monthMouse.pressed ? 0.9 : (monthMouse.containsMouse && !isSelectedMonth ? 1.05 : 1.0)

            Behavior on scale {
              NumberAnimation {
                duration: 150
                easing.type: Easing.OutBack
                easing.overshoot: 1.05
              }
            }
            Behavior on color {
              ColorAnimation {
                duration: 100
              }
            }

            Text {
              anchors.centerIn: parent
              text: modelData
              color: isSelectedMonth ? Color.buttonInactiveBackground : Color.moduleText
              font.family: Style.barFontFamily
              font.pointSize: 13
              font.weight: isSelectedMonth ? Font.Bold : Font.Medium
              Behavior on color {
                ColorAnimation {
                  duration: 150
                }
              }
            }

            MouseArea {
              id: monthMouse
              anchors.fill: parent
              hoverEnabled: true
              cursorShape: Qt.PointingHandCursor
              onClicked: root.monthSelected(index)
            }
          }
        }
      }
    }
  }
}
