//
//  HTNotesViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation

enum HTNotesViewState {
    case hasData(HTNotesViewEntity)
    case isEmpty
}

final class HTNotesViewModel: ObservableObject {
    
    @Published public var state: HTNotesViewState = .isEmpty
    let factory: HTNotesViewFactoryProtocol = HTNotesViewFactory()
    var viewEntity: HTNotesViewEntity?
    let note: String
    
    public init(note: String) {
        self.note = note
    }
    
    public func initState() {
        viewEntity = factory.makeEntity(note: note)
        
        state = .hasData(viewEntity ?? factory.makeEntity(note: note))
    }
}
