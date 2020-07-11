//
//  BatteryProgress.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct BatteryProgress: View {
    var vehicle: Vehicle
    @State private var chargeState: ChargeStateResponse? = nil

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)

            chargeState.map({
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(Double($0.batteryLevel) / Double(100), 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
            })
            VStack {
                chargeState.map({
                    Text("\($0.batteryLevel) %")
                        .font(.title2)
                        .bold()
                })
                chargeState.map({
                    Text("\(String(format: "%.2f", $0.batteryRange)) mi")
                        .font(.caption)
                })
            }
        }
        .onAppear(perform: getChargeData)
    }

    private func getChargeData() {
        let api = Api(vehicle: vehicle)
        api.getChargeState() { chargeState in
            if let chargeState = chargeState {
                self.chargeState = chargeState
            }
        }
    }
}

//struct BatteryProgress_Previews: PreviewProvider {
//    static var previews: some View {
//        BatteryProgress()
//    }
//}
