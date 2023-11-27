//
//  
//  RecoverPasswordViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//
//

import SwiftUI

enum RecoverPasswordViewState {
    case hasData(RecoverPasswordViewEntity)
    case isEmpty
}

final class RecoverPasswordViewModel: ObservableObject {
    
    @Published public var state: RecoverPasswordViewState = .isEmpty
    let factory: RecoverPasswordViewFactoryProtocol = RecoverPasswordViewFactory()
    var viewEntity: RecoverPasswordViewEntity?
    
    public func initState() {
        viewEntity = factory.makeEntity()
        
        state = .hasData(viewEntity ?? factory.makeEntity())
    }
  
}
