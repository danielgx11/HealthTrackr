//
//  HealthTrackrApp.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 04/11/23.
//

import SwiftUI

@main
struct HealthTrackrApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
