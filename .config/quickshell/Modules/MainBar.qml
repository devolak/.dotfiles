import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.Common
import qs.Modules

Variants {
  id: root 
  model: Quickshell.screens
  delegate: PanelWindow {
    id: mainBar
    required property var modelData
    screen: modelData

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "quickshell-bar"

    anchors {
      top: true
      left: true
      right: true
    }
    color: Color.moduleBackground
    // color: transparent
    implicitHeight: Style.barHeight

    Workspaces {
      id: workspaceModule
      targetMonitor: modelData.name
      anchors {
        left: parent.left
        leftMargin: 24
        verticalCenter: parent.verticalCenter
      }
    }

    WindowTitle {
      id: windowTitle
      // targetMonitor: Hyprland.monitorFor(parent.screen)
      // targetMonitor: modelData.name
      // monitor: mainBar.monitor
      screen: mainBar.modelData
      anchors {
        left: workspaceModule.right
        leftMargin: 0
        verticalCenter: parent.verticalCenter
      }
    }

    Calendar {
      id: calendar
      anchors.centerIn: parent
    }

    SystemStats {
      id: statusModule
      anchors {
        right: parent.right
        rightMargin: 15
        verticalCenter: parent.verticalCenter
      }
    }
  }
}
