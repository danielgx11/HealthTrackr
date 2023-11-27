//
//  HTManuallyDataViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation

enum HTManuallyDataViewState {
    case hasData(HTManuallyDataViewEntity)
    case isEmpty
}

final class HTManuallyDataViewModel: ObservableObject {
    
    @Published public var state: HTManuallyDataViewState = .isEmpty
    let factory: HTManuallyDataViewFactoryProtocol = HTManuallyDataViewFactory()
    var viewEntity: HTManuallyDataViewEntity?
    
    public func initState() {
        viewEntity = factory.makeEntity()
        
        state = .hasData(viewEntity ?? factory.makeEntity())
    }
}
