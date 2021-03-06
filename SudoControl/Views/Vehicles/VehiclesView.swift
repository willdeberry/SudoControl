//
//  Vehicles.swift
//  Control
//
//  Created by Will DeBerry on 7/6/20.
//

import SwiftUI
//import SwiftUIPullToRefresh

struct VehiclesView: View {
    @Binding var showSelf: Bool
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        NavigationView {
            List {
                ForEach(appModel.vehicles, id: \.id) { vehicle in
                    let model = parseVehiceInfo(optionCodes: vehicle.optionCodes)
                    NavigationLink(destination: VehicleView(vehicle: vehicle, model: model)) {
                        VehiclesRow(vehicle: vehicle, model: model)
                    }
                }
            }
            .navigationBarTitle(Text("Vehicles"))
            .navigationBarItems(leading:
                Button(action: {
                    appModel.login.logout()
                    showSelf = false
                }) {
                    Image(systemName: "person.crop.circle")
                }
                , trailing:
                Button(action: {
                    appModel.refresh()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
        }
    }
}

struct Vehicles_Previews: PreviewProvider {
    static var previews: some View {
        VehiclesView(showSelf: .constant(true))
            .environmentObject(AppModel())
    }
}
