//
//  SignUpView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 14/11/23.
//

import SwiftUI
import Common

struct SignUpViewEntity {
    let nameEntity: Binding<HTTextFieldViewEntity>
    let emailEntity: Binding<HTTextFieldViewEntity>
    let passwordEntity: Binding<HTTextFieldViewEntity>
    
    let signUpButton: HTButtonViewEntity
    let forgotPasswordButton: HTButtonViewEntity
}

struct SignUpView: View {
    private enum Metrics {
        static let buttonHeight: CGFloat = 51
    }
    
    @ObservedObject var viewModel: SignUpViewModel
    @State private var nameInput: String = ""
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    
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
    func updateView(with entity: SignUpViewEntity) -> some View {
        NavigationView {
            VStack(spacing: HTMetrics.large) {
                
                HStack(alignment: .center) {
                    
                    Spacer()
                    
                    Text("Sign Up")
                        .frame(alignment: .trailing)
                        .font(.bold(.title)())
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginView(viewModel: LoginViewModel())) {
                        Text("Login")
                            .frame(alignment: .trailing)
                            .font(.bold(.callout)())
                            .layoutPriority(0.5)
                            .foregroundColor(Colors.primary_green.color)
                    }
                    
                }
                
                VStack(spacing: HTMetrics.small) {
                    HTTextField(entity: entity.nameEntity,
                                text: $nameInput)
                    
                    HTTextField(entity: entity.nameEntity,
                                text: $emailInput)
                    
                    HTTextField(entity: entity.passwordEntity,
                                text: $passwordInput)
                }
                
                Spacer()
                
                VStack(spacing: HTMetrics.small) {
                    Group {
                        HTButton(entity: entity.signUpButton) { }
                        
                        HTButton(entity: entity.forgotPasswordButton) { }
                    }
                    .frame(maxWidth: .infinity, maxHeight: Metrics.buttonHeight)
                    .cornerRadius(HTMetrics.medium)
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Colors.background.color)
        }
        .navigationBarBackButtonHidden()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
