//
//  ActionsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct ActionsView: View {
    @EnvironmentObject var controlModel: ControlModel
    var vehicle: Vehicle
    @Binding var chargeState: ChargeStateResponse?
    @State private var chargePortOpen: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50) {
                Button(action: {
                    controlModel.api.toggleChargePort(id: vehicle.idS, open: !chargePortOpen) { result in
                        if result {
                            chargePortOpen.toggle()
                        } else {
                            chargePortOpen = ((chargeState?.chargePortDoorOpen) != nil)
                        }
                    }
                }){
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 3.0)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                            Image(systemName: "bolt.fill")
                                .foregroundColor(Color.black)
                        }
                        Text("Open")
                            .font(.subheadline)
                    }
                }

                Button(action: {}){
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 3.0)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                            Image(systemName: "bolt.fill")
                                .foregroundColor(Color.black)
                        }
                        Text("Open")
                            .font(.subheadline)
                    }
                }

                Button(action: {}){
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 3.0)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                            Image(systemName: "bolt.fill")
                                .foregroundColor(Color.black)
                        }
                        Text("Open")
                            .font(.subheadline)
                    }
                }
            }
            HStack(spacing: 50) {
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
            }
            Spacer()
        }
    }
}

struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView(vehicle: vehicle1, chargeState: .constant(sampleChargeState)).environmentObject(ControlModel(nil))
    }
}
