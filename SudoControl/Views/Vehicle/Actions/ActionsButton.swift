//
//  ActionsButton.swift
//  Control
//
//  Created by Will DeBerry on 7/31/20.
//

import SwiftUI

struct ActionsButton: View {
    var action: () -> Void
    var image: String
    var title: String

    var body: some View {
        Button(action: {
            action()
        }){
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.red)
                        .shadow(radius: 10.0, x: 10, y: 10)

                    VStack(spacing: 10) {
                        Image(systemName: image)
                            .foregroundColor(Color.white)
                            .font(.title2)
                        Text(title)
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .bold()
                            .padding([.leading, .trailing], 10)
                    }
                }
            }
        }
    }
}

//struct ActionsButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionsButton()
//    }
//}
