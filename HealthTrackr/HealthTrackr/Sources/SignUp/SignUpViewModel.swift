//
//  SignUpViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import Foundation

enum SignUpViewState {
    case hasData(SignUpViewEntity)
    case isEmpty
}

final class SignUpViewModel: ObservableObject {
    
    @Published public var state: SignUpViewState = .isEmpty
    let factory: SignUpViewFactoryProtocol = SignUpViewFactory()
    var viewEntity: SignUpViewEntity?
    
    public func initState() {
        viewEntity = factory.makeEntity()
        
        state = .hasData(viewEntity ?? factory.makeEntity())
    }
  
}
