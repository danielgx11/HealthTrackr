//
//  Colors.swift
//  
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import Foundation
import SwiftUI

public enum Colors: String {
    case background = "#EDF2FA"
    case primary_green = "AEC77D"
    case darkBackground = "#363636"
    case chartBackground = "#BDBDBD"
    case textLightGray = "#EEEEEE"
    case textMediumGray = "# 666666"
    
    public var color: Color {
        Color(hex: self.rawValue)
    }
}
