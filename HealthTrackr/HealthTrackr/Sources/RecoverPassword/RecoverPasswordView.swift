//
//  RecoverPasswordView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import SwiftUI
import Common

struct RecoverPasswordViewEntity {
    let emailEntity: Binding<HTTextFieldViewEntity>
    
    let recoverButton: HTButtonViewEntity
}

struct RecoverPasswordView: View {
    private enum Metrics {
        static let buttonHeight: CGFloat = 51
    }
    
    @ObservedObject var viewModel: RecoverPasswordViewModel
    @State private var emailInput: String = ""
        
    var body: some View {
        ZStack {
            switch viewModel.state {
            case let .hasData(entity):
                updateView(with: entity)
            case .isEmpty:
                Text("error")
            }
        }
        .background(.clear)
        .onAppear {
            viewModel.initState()
        }
    }
    
    @ViewBuilder
    func updateView(with entity: RecoverPasswordViewEntity) -> some View {
        VStack(spacing: HTMetrics.large) {
            Text("Recover")
                .frame(alignment: .trailing)
                .font(.bold(.title)())

            HTTextField(entity: entity.emailEntity,
                        text: $emailInput)
            
            Spacer()

            HTButton(entity: entity.recoverButton) { }
                .frame(maxWidth: .infinity, maxHeight: Metrics.buttonHeight)
                .cornerRadius(HTMetrics.medium)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Colors.background.color)
    }

}

struct RecoverPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordView(viewModel: RecoverPasswordViewModel())
    }
}
