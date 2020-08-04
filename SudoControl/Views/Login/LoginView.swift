//
//  ContentView.swift
//  Control
//
//  Created by Will DeBerry on 7/5/20.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appModel: AppModel
    @Binding var showVehiclesView: Bool
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            if showVehiclesView {
                VehiclesView(showSelf: $showVehiclesView)
            } else {

                VStack {
                    Text("Control for Tesla")
                        .font(.largeTitle)
                        .foregroundColor(Color.themeTextField)
                        .padding([.top, .bottom], 40)
                        .shadow(radius: 10.0, x: 20, y: 20)

                    Image("TeslaLogo")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .padding(.bottom, 50)

                    VStack {
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.themeTextField)
                            .cornerRadius(20)
                            .shadow(radius: 10.0, x: 20, y: 20)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.themeTextField)
                            .cornerRadius(20)
                            .shadow(radius: 10.0, x: 20, y: 20)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }.padding([.leading, .trailing], 27.5)

                    Button(action: {
                        appModel.authModel.email = email
                        appModel.authModel.password = password
                        email = ""
                        password = ""
                        appModel.login.generate() { success in
                            if success {
                                showVehiclesView = true
                                appModel.refresh()
                            }
                        }
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15)
                            .shadow(radius: 10.0, x: 20, y: 20)
                    }.padding(.top, 50)

                    Spacer()
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showVehiclesView: .constant(false))
            .environmentObject(AppModel())
    }
}
