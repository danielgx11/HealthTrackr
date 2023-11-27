//
//  SignUpViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import Foundation
import SwiftUI
import Common

protocol SignUpViewFactoryProtocol {
    func makeEntity() -> SignUpViewEntity
}

struct SignUpViewFactory: SignUpViewFactoryProtocol {
    
    func makeEntity() -> SignUpViewEntity {
        let nameEntity = makeTextFieldEntity(placeHolder: "Name")
        let emailEntity = makeTextFieldEntity(placeHolder: "Email")
        let passwordEntity = makeTextFieldEntity(placeHolder: "Password", buttonTitle: "Show")
        
        let signUpButton = makeButtonEntity(text: "Sign Up",
                                            buttonColor: Colors.primary_green.color,
                                            buttonTextColor: .white)
        let forgotPasswordButton = makeButtonEntity(text: "Forgot your password?",
                                                    buttonColor: Color.clear,
                                                    buttonTextColor: Colors.primary_green.color)
        
        let entity = SignUpViewEntity(nameEntity: nameEntity,
                                      emailEntity: emailEntity,
                                      passwordEntity: passwordEntity,
                                      signUpButton: signUpButton,
                                      forgotPasswordButton: forgotPasswordButton)
        
        return entity
    }
    
    private func makeTextFieldEntity(placeHolder: String,
                                     buttonTitle: String? = nil) -> Binding<HTTextFieldViewEntity> {
        Binding.constant(HTTextFieldViewEntity(placeHolder: placeHolder,
                                               buttonTitle: buttonTitle,
                                               buttonAction: {}))
    }

    private func makeButtonEntity(text: String,
                                  buttonColor: Color,
                                  buttonTextColor: Color) -> HTButtonViewEntity {
        HTButtonViewEntity(title: text,
                           buttonColor: buttonColor,
                           buttonTextColor: buttonTextColor)
    }
}
