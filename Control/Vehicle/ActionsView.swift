//
//  ActionsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct ActionsView: View {
    @Binding var chargeState: ChargeStateResponse?

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
            }
            HStack {
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
                Button(action: {}){Text("Button")}
            }
            Spacer()
        }
    }
}

//struct ActionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionsView()
//    }
//}
