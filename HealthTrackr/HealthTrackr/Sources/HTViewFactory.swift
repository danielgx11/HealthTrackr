//
//  HTViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import Foundation
import SwiftUI

protocol HTViewFactoryProtocol {
    func makeTextFieldEntity(placeHolder: String,
                             buttonTitle: String?) -> Binding<HTTextFieldViewEntity>
    func makeButtonEntity(text: String,
                          buttonColor: Color,
                          buttonTextColor: Color) -> HTButtonViewEntity
}

extension HTViewFactoryProtocol {
    func makeTextFieldEntity(placeHolder: String, buttonTitle: String?) -> Binding<HTTextFieldViewEntity> {
        Binding.constant(HTTextFieldViewEntity(placeHolder: placeHolder,
                                               buttonTitle: buttonTitle,
                                               buttonAction: {}))
    }
    
    func makeButtonEntity(text: String, buttonColor: Color, buttonTextColor: Color) -> HTButtonViewEntity {
        HTButtonViewEntity(title: text,
                           buttonColor: buttonColor,
                           buttonTextColor: buttonTextColor)
    }
}
