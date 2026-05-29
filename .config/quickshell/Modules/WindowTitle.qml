import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.Common

Rectangle {
  id: root
  // model: Quickshell.screens

  property string targetMonitor: ""
  // readonly property Toplevel activeWindow: ToplevelManager.activeToplevel
  // property string activeWindowName: activeWindow?.activated ? activeWindow?.title : ""

  // property HyprlandWorkspace activeWorkspace: Hyprland.workspaces.values.find(ws => ws.monitor === modelData && ws.active)
  // property string activeWindowTitle: activeWorkspace && activeWorkspace.toplevels.values.length > 0 ? activeWorkspace.toplevels.values[0].title : ""

  readonly property var activeWindow: Hyprland.activeToplevel
  readonly property var thisMonitor: Hyprland.monitorFor(QsWindow.window.screen)

  visible: activeWindow && thisMonitor && activeWindow.monitor && activeWindow.monitor.id === thisMonitor.id

  implicitWidth: windowTitle.width
  implicitHeight: Style.barHeight
  radius: 0

  color: Color.moduleBackground

  Text {
    id: windowTitle
    anchors.centerIn: parent
    width: parent.implicitWidth

    color: Color.moduleText

    font {
      family: Style.barFontFamily
      pixelSize: Style.barFontSize
      bold: true
    }

    text: visible ? activeWindow.title : ""
  }
}
