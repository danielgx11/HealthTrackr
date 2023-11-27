//
//  LoginView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 12/11/23.
//

import SwiftUI
import Common

struct LoginViewEntity {
    var emailTextFieldEntity: Binding<HTTextFieldViewEntity>
    var passwordTextFieldEntity: Binding<HTTextFieldViewEntity>
    var loginButtonEntity: HTButtonViewEntity
    var forgetPasswordButtonEntity: HTButtonViewEntity
}

struct LoginView: View {
    
    private enum Metrics {
        static let buttonHeight: CGFloat = 51
    }
    
    @ObservedObject var viewModel: LoginViewModel
    @State private var showSignUpView = false
    @State private var showHomeView = false
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    
    @State private var textUpdate: String = "Sign Up"
    
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
    func updateView(with entity: LoginViewEntity) -> some View {
        NavigationView {
            VStack(spacing: HTMetrics.large) {
                
                NavigationLink(destination: SignUpView(viewModel: SignUpViewModel()), isActive: $showSignUpView) {
                    EmptyView()
                }
                
                NavigationLink(destination: HTHomeView(showLastNote: Binding<Bool>.constant(false), showHeartRate: Binding<Bool>.constant(false)), isActive: $showHomeView) {
                    EmptyView()
                }
                
                Text("Log In")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.bold(.title)())
                
                VStack(spacing: HTMetrics.small) {
                    HTTextField(entity: entity.emailTextFieldEntity, text: $emailInput)
                        .onChange(of: emailInput) {
                            textUpdate = $0.isEmpty ? "Sign Up" : "Log In"
                        }
                    
                    HTTextField(entity: entity.passwordTextFieldEntity, text: $passwordInput)
                }
                
                Spacer()
                
                VStack(spacing: HTMetrics.small) {
                    Group {
                        HTButton(textUpdatesString: $textUpdate, entity: entity.loginButtonEntity) {
                            if textUpdate == "Log In" {
                                showSignUpView = false
                                viewModel.signIn(email: emailInput, password: passwordInput)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.showHomeView = true
                                }
                            } else {
                                showSignUpView = true
                            }
                        }
                        
                        NavigationLink(destination: RecoverPasswordView(viewModel: RecoverPasswordViewModel())) {
                            HTButton(entity: entity.forgetPasswordButtonEntity) { }
                        }
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
