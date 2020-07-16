//
//  Parsers.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

func parseVehiceInfo(optionCodes: String) -> String {
    let options = optionCodes.components(separatedBy: ",")
    if options.contains("MDLS") || options.contains("MS03") || options.contains("MS04") {
        return "Model S"
    } else if options.contains("MDLX") {
        return "Model X"
    } else if options.contains("MDL3") {
        return "Model 3"
    } else if options.contains("MDLY") {
        return "Model Y"
    }

    return "Unknown Model"
}
