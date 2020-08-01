//
//  ControlApp.swift
//  Control
//
//  Created by Will DeBerry on 7/5/20.
//

import SwiftUI

@main
struct SudoControlApp: App {
    @ObservedObject var appModel = AppModel()
    @Environment(\.scenePhase) private var scenePhase
    @State private var showVehicleView: Bool = false
    private var token: String = ""

    init() {
        if let token = appModel.authModel.token {
            self.token = token.accessToken
        }

        self._showVehicleView = State(initialValue: !token.isEmpty)
    }

    var body: some Scene {
        WindowGroup {
            LoginView(showVehiclesView: $showVehicleView).environmentObject(appModel)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("scene is now active!")
            case .inactive:
                print("scene is now inactive!")
            case .background:
                print("scene is now in the background!")
            @unknown default:
                print("Apple must have added something new!")
            }
        }
    }
}
