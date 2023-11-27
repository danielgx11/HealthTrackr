//
//  HTManuallyDataViewFactory.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import Foundation
import SwiftUI
import Common

protocol HTManuallyDataViewFactoryProtocol: HTViewFactoryProtocol {
    func makeEntity() -> HTManuallyDataViewEntity
}

struct HTManuallyDataViewFactory: HTManuallyDataViewFactoryProtocol {
    
    func makeEntity() -> HTManuallyDataViewEntity {
        let backButton = "Back"
        let title = "Manually Data"
        
        let heartRateTextField = makeTextFieldEntity(placeHolder: "Heart Rate", buttonTitle: nil)
        let stepsTextField = makeTextFieldEntity(placeHolder: "Steps", buttonTitle: nil)
        let workoutTimeTextField = makeTextFieldEntity(placeHolder: "Workout Time", buttonTitle: nil)
        
        let switchManuallyDataTitle = "Manually Data"
        let switchMentalHealthTitle = "Mental Health crisis occurred"
        
        let doneButton = makeButtonEntity(text: "Done", buttonColor: Colors.primary_green.color, buttonTextColor: .white)
        
        let entity = HTManuallyDataViewEntity(backButton: backButton,
                                              title: title,
                                              heartRateTextField: heartRateTextField,
                                              stepsTextField: stepsTextField,
                                              workoutTimeTextField: workoutTimeTextField,
                                              switchManuallyDataTitle: switchManuallyDataTitle,
                                              switchMentalHealthCrisisTitle: switchMentalHealthTitle,
                                              doneButton: doneButton)
        
        return entity
    }
    
}
