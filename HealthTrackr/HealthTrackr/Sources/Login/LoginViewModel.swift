//
//  LoginViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import Foundation

enum LoginViewState {
    case hasData(LoginViewEntity)
    case isEmpty
}

final class LoginViewModel: ObservableObject {
    
    @Published public var state: LoginViewState = .isEmpty
    let factory: LoginViewFactoryProtocol = LoginViewFactory()
    var viewEntity: LoginViewEntity?
    
    public func initState() {
        viewEntity = factory.makeEntity()
        
        state = .hasData(viewEntity ?? factory.makeEntity())
    }
  
    public func signIn(email: String, password: String) {
        
    }
}
