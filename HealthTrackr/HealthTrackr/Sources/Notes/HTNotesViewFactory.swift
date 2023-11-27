//
//  HTNotesViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation
import SwiftUI
import Common

protocol HTNotesViewFactoryProtocol: HTViewFactoryProtocol {
    func makeEntity(note: String) -> HTNotesViewEntity
}

struct HTNotesViewFactory: HTNotesViewFactoryProtocol {
    
    func makeEntity(note: String) -> HTNotesViewEntity {
        
        let button = makeButtonEntity(text: "Send",
                                      buttonColor: Colors.primary_green.color,
                                      buttonTextColor: .white)
        
        let entity = HTNotesViewEntity(note: Binding<String>.constant(note),
                                       sendButton: button)
        
        return entity
    }
    
}
