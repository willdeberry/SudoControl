//
//  ActionsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct ActionsView: View {
    var vehicle: Vehicle
    @Binding var chargeState: ChargeStateResponse?
    var api: Api
    @State private var chargePortOpen: Bool = false

    init(vehicle: Vehicle, chargeState: Binding<ChargeStateResponse?>) {
        self.vehicle = vehicle
        self._chargeState = chargeState
        self.api = Api(vehicle: vehicle)
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50) {
                Button(action: {
                    api.toggleChargePort(open: !chargePortOpen) { result in
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
        ActionsView(vehicle: vehicle1, chargeState: .constant(sampleChargeState))
    }
}
