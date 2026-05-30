import QtQuick
import qs.Services
import qs.Common
import qs.Widgets

Item {
  id: root

  implicitWidth: visualPill.implicitWidth
  implicitHeight: visualPill.implicitHeight

  Rectangle {
    id: visualPill
    anchors.centerIn: parent

    implicitWidth: timeLabel.implicitWidth + 32
    implicitHeight: timeLabel.implicitHeight + 16
    radius: 4

    color: {
      if (calendarWidget.visible)
        return Qt.tint(Color.moduleBackground, Qt.rgba(Color.moduleText.r, Color.moduleText.g, Color.moduleText.b, 0.12));
      if (pillMouse.containsMouse)
        return Qt.tint(Color.moduleBackground, Qt.rgba(Color.moduleText.r, Color.moduleText.g, Color.moduleText.b, 0.08));

      return Color.moduleBackground;
    }

    scale: pillMouse.pressed ? 0.95 : 1.0

    MouseArea {
      id: pillMouse
      anchors.fill: parent
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      onClicked: calendarWidget.visible = !calendarWidget.visible
    }

    Text {
      id: timeLabel
      anchors.centerIn: parent
      text: Time.time

      color: Color.moduleText

      font {
        family: Style.barFontFamily
        pixelSize: Style.barFontSize
        bold: true
      }
    }
  }

  CalendarWidget {
    id: calendarWidget
    visible: false
  }
}
