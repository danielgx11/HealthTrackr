//
//  HTNoteReviewView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import SwiftUI
import Common

struct HTNoteReviewViewEntity {
    
    let emojis: [String]
    let title: String
    let description: String
    let loveItButton: HTButtonViewEntity
    let dismissButton: HTButtonViewEntity
}

struct HTNoteReviewView: View {
    @ObservedObject var viewModel: HTNoteReviewViewModel
    @State private var note: String = "Compose your messa here"
    
    @State private var showHome = false
    @State private var isSelectedAnEmoji = false
    @State private var selectedEmoji: String = ""
    
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
    func updateView(with entity: HTNoteReviewViewEntity) -> some View {
        NavigationView {
            VStack {
                ZStack {
                    Colors.background.color
                        .cornerRadius(HTMetrics.small)
                        .frame(maxHeight: UIScreen.main.bounds.height / 2)
                    
                    VStack(alignment: .center, spacing: HTMetrics.medium) {
                        
                        NavigationLink(destination: HTHomeView(showLastNote: Binding<Bool>.constant(true), showHeartRate: Binding<Bool>.constant(false)), isActive: $showHome) {
                            EmptyView()
                        }
                        
                        HStack {
                            ForEach(entity.emojis, id: \.self) { emoji in
                                Image(emoji)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: HTMetrics.large,
                                               height: HTMetrics.large,
                                               alignment: .center)
                                        .scaleEffect(isSelectedAnEmoji && selectedEmoji == emoji ? 1.4 : 1)
                                        .onTapGesture {
                                            isSelectedAnEmoji = true
                                            selectedEmoji = emoji
                                        }

                            }
                        }
                        
                        Text(entity.title)
                            .foregroundColor(.black)
                            .font(.bold(.title)())
                        
                        Text(entity.description)
                            .foregroundColor(Colors.textMediumGray.color)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                        
                        
                            HTButton(entity: entity.loveItButton) {
                                showHome = true
                            }
                            .cornerRadius(HTMetrics.medium)
                        
                        HTButton(entity: entity.dismissButton) {
                            // TODO: just go to next view
                        }
                    }
                    .padding()
                    
                }
                .padding()
                .background(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(.gray)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HTNoteReviewView_Previews: PreviewProvider {
    static var previews: some View {
        HTNoteReviewView(viewModel: HTNoteReviewViewModel())
    }
}
