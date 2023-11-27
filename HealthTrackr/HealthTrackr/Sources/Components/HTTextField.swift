//
//  HTTextField.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import SwiftUI
import Common

struct HTTextFieldViewEntity {
    let placeHolder: String
    let buttonTitle: String?
    let buttonAction: () -> Void
}

struct HTTextField: View {
    @Binding var entity: HTTextFieldViewEntity
    @Binding var text: String

    var body: some View {
        HStack {
            TextField(entity.placeHolder,
                      text: $text)
            .padding(HTMetrics.little)
            .foregroundColor(Colors.textMediumGray.color)
            
            if let buttonTitle = entity.buttonTitle {
                Button(action: entity.buttonAction) {
                    Text(buttonTitle)
                        .foregroundColor(Colors.primary_green.color)
                }
                .padding()
            }
        }
        .background(Color.white)
        .cornerRadius(HTMetrics.tiny)
    }
}

struct HTTextField_Previews: PreviewProvider {
    static var previews: some View {
        HTTextField(entity: Binding.constant(HTTextFieldViewEntity(placeHolder: "Email", buttonTitle: nil, buttonAction: {})), text: .constant(""))
    }
}
