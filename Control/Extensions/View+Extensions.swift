//
//  View+Extensions.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import SwiftUI

extension View {
    func debugPrint(_ value: Any) -> some View {
        #if DEBUG
        print(value)
        #endif
        return self
    }
}
