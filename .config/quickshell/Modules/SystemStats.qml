import QtQuick
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import qs.Common

Rectangle {
  id: root

  implicitWidth: contentLayout.width + 30
  implicitHeight: contentLayout.height + 18
  color: Color.moduleBackground
  radius: 4

  readonly property var activeSink: Pipewire.defaultAudioSink
  readonly property bool isMuted: activeSink?.audio?.muted ?? true
  readonly property real volumeLevel: activeSink?.audio?.volume ?? 0.0

  PwObjectTracker {
    objects: root.activeSink ? [root.activeSink] : []
  }

  Row {
    id: contentLayout
    anchors.centerIn: parent
    spacing: 16

    // --- Mpris Module ---
    Row {
      id: mprisModule
      spacing: 8

      property MprisPlayer player: Mpris.players.values.length > 0 ? Mpris.players.values[0] : null

      Text {
        text: parent.player.isPlaying
          ? ""
          : ""

        color: Color.moduleText
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
          italic: true
          bold: true
        }
      }

      Text {
        property string trackTitle: parent.player.trackTitle.length > 50
          ? parent.player.trackTitle.substring(0, 50) + "..."
          : parent.player.trackTitle

        property string trackArtist: parent.player.trackArtist.length > 20
          ? parent.player.trackArtist.substring(0, 20) + "..."
          : parent.player.trackArtist

        text: parent.player
          ? trackTitle + " - " + trackArtist
          : ""

        color: Color.moduleText
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
          italic: true
          bold: true
        }
      }
    }

    // --- Volume Module ---
    Row {
      id: volumeModule
      spacing: 8

      Text {
        id: volumeIcon
        anchors.verticalCenter: parent.verticalCenter
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
        }
        color: root.isMuted ? Color.moduleText : Color.moduleText

        text: {
          if (!root.activeSink?.audio)
            return " "; // No device
          if (root.isMuted)
            return " "; // Muted
          if (root.volumeLevel > 0.69)
            return " "; // High
          if (root.volumeLevel > 0.32)
            return " "; // Mid

          return " ";      
        }
      }
      Text {
        id: volumeLabel
        anchors.verticalCenter: parent.verticalCenter
        color: Color.moduleText
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
          bold: true
        }
        text: root.activeSink?.audio ? Math.round(root.volumeLevel * 100) + "%" : "--%"
      }

      TapHandler {
        onTapped: if (root.activeSink?.audio)
        root.activeSink.audio.muted = !root.isMuted
        cursorShape: Qt.PointingHandCursor
      }
    }

    // --- Battery Module ---
    Row {
      id: batteryModule
      spacing: 8

      // Internal logic to keep UI bindings clean
      readonly property bool isVisible: UPower.displayDevice?.isPresent ?? false
      readonly property real capacity: (UPower.displayDevice?.percentage ?? 0) * 100
      readonly property bool isCharging: !UPower.onBattery

      visible: isVisible

      Text {
        id: batteryIcon
        anchors.verticalCenter: parent.verticalCenter
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
        }

        // Color logic: Alert user if charging (active state) or critically low
        color: (batteryModule.isCharging && batteryModule.capacity < 100) || batteryModule.capacity <= 20 ? Color.buttonHoverBackground : Color.moduleText

        text: {
          if (!batteryModule.isVisible)
            return "";
          if (batteryModule.isCharging && batteryModule.capacity < 100)
            return "";

          // Capacity breakpoints
          if (batteryModule.capacity >= 90)
            return "󰂂";
          if (batteryModule.capacity >= 70)
            return "󰂀";
          if (batteryModule.capacity >= 50)
            return "󰁾";
          if (batteryModule.capacity >= 30)
            return "󰁼";
          if (batteryModule.capacity >= 10)
            return "󰁺";

          return "󰂃";
        }
      }

      Text {
        id: batteryLabel
        anchors.verticalCenter: parent.verticalCenter
        color: Color.moduleText
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
        }
        text: Math.round(batteryModule.capacity) + "%"
      }
    }
  }
}
