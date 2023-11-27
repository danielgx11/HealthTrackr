//
//  HTNoteReviewViewModel.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation

enum HTNoteReviewViewState {
    case hasData(HTNoteReviewViewEntity)
    case isEmpty
}

final class HTNoteReviewViewModel: ObservableObject {
    
    @Published public var state: HTNoteReviewViewState = .isEmpty
    let factory: HTNoteReviewViewFactoryProtocol = HTNoteReviewViewFactory()
    var viewEntity: HTNoteReviewViewEntity?
    
    public func initState() {
        viewEntity = factory.makeEntity()
        
        state = .hasData(viewEntity ?? factory.makeEntity())
    }
}
