//
//  RecoverPasswordViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import Foundation
import SwiftUI
import Common

protocol RecoverPasswordViewFactoryProtocol: HTViewFactoryProtocol {
    func makeEntity() -> RecoverPasswordViewEntity
}

struct RecoverPasswordViewFactory: RecoverPasswordViewFactoryProtocol {
    
    func makeEntity() -> RecoverPasswordViewEntity {
        let emailEntity = makeTextFieldEntity(placeHolder: "Email", buttonTitle: nil)
        let recoverEntity = makeButtonEntity(text: "Recover", buttonColor: Colors.primary_green.color, buttonTextColor: .white)
        
        let entity = RecoverPasswordViewEntity(emailEntity: emailEntity, recoverButton: recoverEntity)
        
        return entity
    }
}
