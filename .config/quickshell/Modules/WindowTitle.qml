import Quickshell
import QtQuick
import Quickshell.Hyprland
import qs.Common

Rectangle {
  id: root
  required property ShellScreen screen

  readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
  readonly property HyprlandWorkspace workspace: monitor?.activeWorkspace

  property string lastTitle: ""

  implicitWidth: contentLayout.width + 32
  implicitHeight: Style.barHeight
  radius: 4

  color: Color.moduleBackground

  Row {
    id: contentLayout
    anchors.centerIn: parent

    Text {
      id: windowTitle
      // anchors.centerIn: parent

      color: Color.moduleText

      font {
        family: Style.barFontFamily
        pixelSize: Style.barFontSize
        bold: true
      }

      function getWindowTitle() {

        if (root.workspace.toplevels.values.length === 0) {
          return ""
        }

        if (!root.workspace) {
          return root.lastTitle
        }

        const active = root.workspace.toplevels.values.find(w => w.activated)

        if (active?.title) {
          root.lastTitle = active.title
        }

        return active?.title ?? root.lastTitle
      }

      text: {
        const title = windowTitle.getWindowTitle()

        if (title.length > 60) {
          return title.substring(0, 60) + "..."
        } else {
          return title
        }
      }
    }
  }
}
