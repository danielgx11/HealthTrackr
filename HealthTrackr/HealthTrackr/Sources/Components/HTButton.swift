//
//  HTButton.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import SwiftUI
import Common

struct HTButtonViewEntity {
    let title: String
    let buttonColor: Color
    let buttonTextColor: Color
}

struct HTButton: View {
    @Binding var textUpdatesString: String
    var entity: HTButtonViewEntity
    var action: () -> Void
    
    init(textUpdatesString: Binding<String>? = nil,
         entity: HTButtonViewEntity,
         action: @escaping () -> Void) {
        _textUpdatesString = textUpdatesString ?? .constant("")
        self.entity = entity
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(textUpdatesString.isEmpty ? entity.title : textUpdatesString)
                .font(.bold(.headline)())
                .foregroundColor(entity.buttonTextColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(entity.buttonColor)
        }
    }
}

struct HTButton_Previews: PreviewProvider {
    static var previews: some View {
        HTButton(entity: HTButtonViewEntity(title: "Log In",
                                            buttonColor: Colors.primary_green.color,
                                            buttonTextColor: .white), action: {})
    }
}
