import QtQuick
import Quickshell.Hyprland
import qs.Common

Rectangle {
  id: root

  property string targetMonitor: ""

  readonly property int animDurationShort: 100
  readonly property int spacingAmount: 0

  implicitWidth: mainLayout.width
  implicitHeight: Style.barHeight
  radius: 0

  color: Color.buttonInactiveBackground

  Row {
    id: mainLayout
    anchors.centerIn: parent
    spacing: root.spacingAmount

    Repeater {
      model: Hyprland.workspaces

      delegate: Rectangle {
        width: workspaceText.implicitWidth + 20
        height: Style.barHeight
        radius: 0

        visible: modelData.id >= 1 && modelData.monitor?.name === root.targetMonitor

        color: {
          if (dotMouseArea.hovered)
            return Color.buttonHoverBackground;
          else if (modelData.focused)
            return Color.buttonFocusedBackground;
          else
            return Color.buttonInactiveBackground;
        }

        Text {
          id: workspaceText
          anchors.centerIn: parent
          text: modelData.name

          color: {
            if (dotMouseArea.hovered)
              return Color.buttonInactiveBackground; 
            else if (modelData.focused)
              return Color.buttonInactiveBackground;
            else
              return Color.buttonFocusedBackground;

          }
          font {
            family: Style.barFontFamily
            pixelSize: Style.barFontSize
            bold: true
          }
        }

        Behavior on color {
          ColorAnimation {
            duration: root.animDurationShort
            easing.type: Easing.OutBack
          }
        }

        TapHandler {
          onTapped: modelData.activate()
        }

        HoverHandler {
          id: dotMouseArea
          cursorShape: Qt.PointingHandCursor
        }
      }
    }
  }
}
