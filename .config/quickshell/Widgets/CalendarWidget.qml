import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.Common

PanelWindow {
  id: root

  implicitWidth: 700
  implicitHeight: 480
  color: "transparent"

  anchors.top: true
  margins {
    top: 70
    right: 16
  }

  WlrLayershell.namespace: "calendar_widget"
  WlrLayershell.layer: WlrLayer.Top
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

  HyprlandFocusGrab {
    id: focusGrab
    windows: [root]
    active: root.visible
    onCleared: root.visible = false
  }

  Rectangle {
    anchors.fill: parent
    color: Color.moduleBackground
    radius: 4

    border.color: Color.moduleBackground
    border.width: 1

    CalendarGrid {
      anchors.fill: parent

      isWindowVisible: root.visible

      onRequestClose: root.visible = false
    }
  }
}
