import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import qs.Common
import qs.Modules
// import qs.Services

Variants {
  id: root 
  model: Quickshell.screens
  delegate: PanelWindow {
    id: mainBar
    required property var modelData
    screen: modelData

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell-bar"

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
    visible: !FullscreenState.isFullscreen(monitor)

    anchors {
      top: true
      left: true
      right: true
    }
    color: Color.moduleBackground
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
  }

  // implicitHeight: 32
}
