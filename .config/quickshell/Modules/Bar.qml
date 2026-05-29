import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
// import Quickshell.Io
import QtQuick
import QtQuick.Layouts

// import qs.Services
// import qs.Widgets
import qs.Common
// import qs.theme

PanelWindow {
  id: bar

  property int volumeLevel: 0

  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 32
  color: Color.moduleBackground

  // Process {
  //   id: volProc
  //   command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
  //   stdout: SplitParser {
  //     onRead: data => {
  //       if (!data)
  //         return;
  //       var match = data.match(/Volume:\s*([\d.]+)/);
  //       if (match) {
  //         volumeLevel = Math.round(parseFloat(match[1]) * 100);
  //       }
  //     }
  //   }
  //   Component.onCompleted: running = true
  // }

  // Timer {
  //   interval: 2000
  //   running: true
  //   repeat: true
  //   onTriggered: {
  //     volProc.running = true;
  //   }
  // }

  Connections {
    target: Hyprland
    function onRawEvent(event) {
      // windowProc.running = true
      // layoutProc.running = true
    }
  }

  RowLayout {
    anchors.fill: parent
    anchors.margins: 4
    // anchors.top: parent.top
    // spacing: 10

    // Left section
    RowLayout {
      id: leftSection
      // anchors.left: parent.left
      Layout.alignment: Qt.AlignLeft
      // anchors.leftMargin: 8
      spacing: 10
      Layout.leftMargin: 8
      // Layout.rightMargin: 8

      Text {
        text: "filler"
        color: Color.moduleText
      }

      // Repeater {
      //   model: 5
      //
      //   Text {
      //     property var ws: Hyprland.workspaces.values.find(w => w.id == index + 1)
      //     property bool isActive: HyprlandWorkspace.active?.id == (index + 1)
      //
      //     text: index + 1
      //     color: isActive ? Color.buttonActiveBackground : (ws ? Color.buttonActiveBackground : Color.buttonActiveBackground)
      //     font {
      //       family: Style.barFontFamily
      //       pixelSize: Style.barFontSize
      //       bold: true
      //     }
      //
      //     MouseArea {
      //       anchors.fill: parent
      //       onClicked: Hyprland.dispatch("workspace " + (index + 1))
      //     }
      //   }
      // }

      // Item {
      //   Layout.fillWidth: true
      // }

      // Rectangle { width: 200; height: 16; color: "#161616" }

      // Item {
      //   Layout.fillWidth: true
      // }
    }

    // Center section
    RowLayout {
      id: centerSection
      // anchors.horizontalCenter: parent.horizontalCenter
      Layout.alignment: Qt.AlignCenter

      Text {
        id: clock
        text: Qt.formatTime(new Date(), "hh:mm AP")
        color: Color.moduleText
        font {
          family: Style.barFontFamily
          pixelSize: Style.barFontSize
          bold: true
        }
      }

      Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
          clock.text = Qt.formatTime(new Date(), "hh:mm AP");
        }
      }
    }

    // Right section
    RowLayout {
      id: rightSection
      Layout.alignment: Qt.AlignRight
      Layout.rightMargin: 8

      Text {
        text: "Vol: " + volumeLevel + "%"
        color: Color.moduleText
        font.pixelSize: Style.barFontSize
        font.family: Style.barFontFamily
        font.bold: true
        // Layout.rightMargin: 8
      }
    }
  }
}
