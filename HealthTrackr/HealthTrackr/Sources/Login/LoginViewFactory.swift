//
//  LoginViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import Foundation
import SwiftUI
import Common

protocol LoginViewFactoryProtocol {
    func makeEntity() -> LoginViewEntity
}

struct LoginViewFactory: LoginViewFactoryProtocol {
    
    func makeEntity() -> LoginViewEntity {
        let emailEntity = makeTextFieldEntity(placeHolder: "Email")
        let passwordEntity = makeTextFieldEntity(placeHolder: "Password")
        
        let loginButtonEntity = makeButtonEntity(text: "Log In",
                                                 buttonColor: Colors.primary_green.color,
                                                 buttonTextColor: .white)
        
        let passwordButtonEntity = makeButtonEntity(text: "Forget your password?",
                                                    buttonColor: .clear,
                                                    buttonTextColor: Colors.primary_green.color)
        
        return LoginViewEntity(emailTextFieldEntity: emailEntity,
                               passwordTextFieldEntity: passwordEntity,
                               loginButtonEntity: loginButtonEntity,
                               forgetPasswordButtonEntity: passwordButtonEntity)
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
