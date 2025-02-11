import SwiftUI

enum NavigationTag: String {
  case simpleModifications
  case functionKeys
  case complexModifications
  case complexModificationsAdvanced
  case devices
  case virtualKeyboard
  case profiles
  case ui
  case update
  case misc
  case uninstall
  case log
  case pro
  case action
}

struct ContentView: View {
  @ObservedObject private var contentViewStates = ContentViewStates.shared
  @ObservedObject private var settings = LibKrbn.Settings.shared

  let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
  let padding = 6.0

  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          if settings.unsafeUI {
            Button(action: {
              contentViewStates.navigationSelection = .pro
            }) {
              HStack {
                Spacer()

                Text("Unsafe configuration is enabled")

                Spacer()
              }
              .sidebarButtonLabelStyle()
            }
            .buttonStyle(PlainButtonStyle())
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(5)

            Divider()
              .padding(.vertical, 2.0)
          }

          Group {
            Button(action: {
              contentViewStates.navigationSelection = .simpleModifications
            }) {
              SidebarLabelView(text: "Simple Modifications", systemImage: "gearshape", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .simpleModifications)

            Button(action: {
              contentViewStates.navigationSelection = .functionKeys
            }) {
              SidebarLabelView(
                text: "Function Keys", systemImage: "speaker.wave.2.circle", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .functionKeys
            )

            Button(action: {
              contentViewStates.navigationSelection = .complexModifications
            }) {
              SidebarLabelView(
                text: "Complex Modifications", systemImage: "gearshape.2", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .complexModifications)

            Button(action: {
              contentViewStates.navigationSelection = .complexModificationsAdvanced
            }) {
              SidebarLabelView(text: "Parameters", systemImage: "dial.min", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .complexModificationsAdvanced)
          }

          Divider()
            .padding(.vertical, 10.0)

          Group {
            Button(action: {
              contentViewStates.navigationSelection = .devices
            }) {
              SidebarLabelView(text: "Devices", systemImage: "keyboard", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .devices)

            Button(action: {
              contentViewStates.navigationSelection = .virtualKeyboard
            }) {
              SidebarLabelView(text: "Virtual Keyboard", systemImage: "puzzlepiece", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .virtualKeyboard)

            Button(action: {
              contentViewStates.navigationSelection = .profiles
            }) {
              SidebarLabelView(text: "Profiles", systemImage: "person.3", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .profiles)

            Button(action: {
              contentViewStates.navigationSelection = .ui
            }) {
              SidebarLabelView(text: "UI", systemImage: "switch.2", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .ui)
          }

          Divider()
            .padding(.vertical, 10.0)

          Group {
            Button(action: {
              contentViewStates.navigationSelection = .update
            }) {
              SidebarLabelView(text: "Update", systemImage: "network", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .update)

            Button(action: {
              contentViewStates.navigationSelection = .misc
            }) {
              SidebarLabelView(text: "Misc", systemImage: "leaf", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .misc)

            Button(action: {
              contentViewStates.navigationSelection = .uninstall
            }) {
              SidebarLabelView(text: "Uninstall", systemImage: "trash", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .uninstall)
          }

          Divider()
            .padding(.vertical, 10.0)

          Group {
            Button(action: {
              contentViewStates.navigationSelection = .log
            }) {
              SidebarLabelView(text: "Log", systemImage: "doc.plaintext", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .log)

            Button(action: {
              contentViewStates.navigationSelection = .pro
            }) {
              SidebarLabelView(text: "Pro", systemImage: "flame", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .pro)

            Button(action: {
              contentViewStates.navigationSelection = .action
            }) {
              SidebarLabelView(text: "Quit, Restart", systemImage: "bolt.circle", padding: 2.0)
            }
            .sidebarButtonStyle(
              selected: contentViewStates.navigationSelection == .action)
          }

          Spacer()
        }
        .frame(width: 250)

        Divider()

        VStack(alignment: .leading, spacing: 0) {
          if settings.saveErrorMessage != "" {
            VStack {
              Label(
                "Save failed:\n\(settings.saveErrorMessage)",
                systemImage: "exclamationmark.circle.fill"
              )
              .padding()
            }
            .foregroundColor(Color.errorForeground)
            .background(Color.errorBackground)
          }

          switch contentViewStates.navigationSelection {
          case .simpleModifications:
            SimpleModificationsView()
          case .functionKeys:
            FunctionKeysView()
          case .complexModifications:
            ComplexModificationsView()
          case .complexModificationsAdvanced:
            ComplexModificationsAdvancedView()
          case .devices:
            DevicesView()
          case .virtualKeyboard:
            VirtualKeyboardView()
          case .profiles:
            ProfilesView()
          case .ui:
            UIView()
          case .update:
            UpdateView()
          case .misc:
            MiscView()
          case .uninstall:
            UninstallView()
          case .log:
            LogView()
          case .pro:
            ProView()
          case .action:
            ActionView()
          }
        }
      }
    }
    .frame(
      minWidth: 1100,
      maxWidth: .infinity,
      minHeight: 680,
      maxHeight: .infinity)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
