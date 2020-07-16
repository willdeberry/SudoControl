//
//  ControlModel.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

class ControlModel: ObservableObject {
    @Published var vehicles: [Vehicle] = [Vehicle]()
    let authModel: AuthModel = AuthModel()
    let api: Api
    var login: Login

    init() {
        api = Api(authModel: authModel)
        login = Login(authModel: authModel)
    }
}
