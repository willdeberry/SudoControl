//
//  ActionsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct ActionsView: View {
    var vehicle: Vehicle
    @Binding var state: VehicleStateResponse?
    @Binding var chargeState: ChargeStateResponse?
    @EnvironmentObject var appModel: AppModel
    @State private var chargePortOpen: Bool = false
    @State private var windowsOpen: Bool = false
    @State private var doorsOpen: Bool = false

    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 100))
        ]

        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ActionsButton(action: toggleChargePort, image: "bolt.fill", title: "Charge")
                ActionsButton(action: toggleWindows, image: "wake", title: "Vent")
                ActionsButton(action: toggleDoorLocks, image: "lock.open.fill", title: "Unlock")
                ActionsButton(action: toggleChargePort, image: "bolt.fill", title: "Frunk")
                ActionsButton(action: toggleChargePort, image: "bolt.fill", title: "Trunk")
                ActionsButton(action: toggleChargePort, image: "bolt.fill", title: "Honk")
            }
            .padding()
        }
    }

    private func toggleChargePort() {
        appModel.api.toggleChargePort(id: vehicle.idS, open: !chargePortOpen) { result in
            if result {
                chargePortOpen.toggle()
            } else {
                chargePortOpen = ((chargeState?.chargePortDoorOpen) != nil)
            }
        }
    }

    private func toggleWindows() {
        appModel.api.toggleWindows(id: vehicle.idS, open: !windowsOpen) { result in
            if result {
                windowsOpen.toggle()
            }
        }
    }

    private func toggleDoorLocks() {
        appModel.api.toggleDoorLocks(id: vehicle.idS, open: !doorsOpen) { result in
            if result {
                doorsOpen.toggle()
            } else {
                doorsOpen = ((state?.locked) != nil)
            }
        }
    }
}

//struct ActionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionsView(vehicle: vehicle1)
//            .environmentObject(ControlModel(isLoading: false, chargeState: sampleChargeState))
//    }
//}
