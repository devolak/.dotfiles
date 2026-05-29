pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  readonly property string barFontFamily: "JetBrainsMono Nerd Font"
  readonly property int barFontSize: 14
  readonly property int barHeight: 32
  readonly property int barWidth: 32
}
