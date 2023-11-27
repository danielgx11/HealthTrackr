//
//  HTNoteReviewViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation
import SwiftUI
import Common

protocol HTNoteReviewViewFactoryProtocol: HTViewFactoryProtocol {
    func makeEntity() -> HTNoteReviewViewEntity
}

struct HTNoteReviewViewFactory: HTNoteReviewViewFactoryProtocol {
    
    func makeEntity() -> HTNoteReviewViewEntity {
        
        let emojis = [
            "crying-emoji",
            "frowning-emoji",
            "neutral-emoji",
            "smilling-emoji",
            "grinning-emoji"
        ]
        
        let description = """
        Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.
        """
        let loveItButton = makeButtonEntity(text: "I love it!",
                                      buttonColor: Colors.primary_green.color,
                                      buttonTextColor: .white)
        
        let dismissButton = makeButtonEntity(text: "Not today, bro",
                                             buttonColor: .clear,
                                             buttonTextColor: Colors.primary_green.color)
        
        return HTNoteReviewViewEntity(emojis: emojis,
                                      title: "Rate your Humor",
                                      description: description,
                                      loveItButton: loveItButton,
                                      dismissButton: dismissButton)
    }
    
}
