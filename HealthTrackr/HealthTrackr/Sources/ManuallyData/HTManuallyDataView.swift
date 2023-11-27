//
//  HTManuallyDataView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import SwiftUI
import Common

struct HTManuallyDataViewEntity {
    let backButton: String
    let title: String
    
    let heartRateTextField: Binding<HTTextFieldViewEntity>
    let stepsTextField: Binding<HTTextFieldViewEntity>
    let workoutTimeTextField: Binding<HTTextFieldViewEntity>
    
    let switchManuallyDataTitle: String
    let switchMentalHealthCrisisTitle: String
    
    let doneButton: HTButtonViewEntity
}

struct HTManuallyDataView: View {
    
    @ObservedObject var viewModel: HTManuallyDataViewModel
    
    @State private var heartRateInput: String = ""
    @State private var stepsInput: String = ""
    @State private var workoutTimeInput: String = ""
    
    @State private var isManuallyData = false
    @State private var hasMentalHealthCrisis = false
    
    @State private var showHome = false
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case let .hasData(entity):
                updateView(with: entity)
            case .isEmpty:
                Text("")
            }
        }
        .background(.clear)
        .onAppear {
            viewModel.initState()
        }
    }
    
    @ViewBuilder
    func updateView(with entity: HTManuallyDataViewEntity) -> some View {
        NavigationView {
            
            VStack {
                VStack(spacing: HTMetrics.small){
                    NavigationLink(destination: HTHomeView(showLastNote: Binding<Bool>.constant(true),
                                                           showHeartRate: Binding<Bool>.constant(true)), isActive: $showHome) {
                        EmptyView()
                    }
                    HStack {
                    
                        Button {
                            // TODO: pop
                        } label: {
                            Text(entity.backButton)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                        Spacer()
                        
                        Text(entity.title)
                            .foregroundColor(.black)
                            .font(.bold(.title)())

                        
                        Spacer()
                    }
                    
                    
                    Group {
                        HTTextField(entity: entity.heartRateTextField, text: $heartRateInput)
                        
                        HTTextField(entity: entity.stepsTextField, text: $stepsInput)
                        
                        HTTextField(entity: entity.workoutTimeTextField, text: $workoutTimeInput)
                    }
                    
                    VStack {
                        ForEach(0..<2) { index in
                            Toggle(index == .zero ? entity.switchManuallyDataTitle : entity.switchMentalHealthCrisisTitle,
                                   isOn: index == .zero ? $isManuallyData : $hasMentalHealthCrisis)
                            .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    
                    HTButton(entity: entity.doneButton) {
                        showHome = true
                    }
                    .cornerRadius(HTMetrics.medium)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.background.color)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HTManuallyDataView_Previews: PreviewProvider {
    static var previews: some View {
        HTManuallyDataView(viewModel: HTManuallyDataViewModel())
    }
}
