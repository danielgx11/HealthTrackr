//
//  HTNotesView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 26/11/23.
//

import SwiftUI
import Common

struct HTNotesViewEntity {

    var note: Binding<String>
    let sendButton: HTButtonViewEntity
}

struct HTNotesView: View {
    
    @ObservedObject var viewModel: HTNotesViewModel
    @State var note: String
    @State private var showHome = false
    private var defaultNote: String = "Compose your message here"
    
    public init(viewModel: HTNotesViewModel, note: String = "") {
        self.viewModel = viewModel
        self.note = note
    }
    
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
            if note.isEmpty { note = defaultNote }
        }
    }
    
    @ViewBuilder
    func updateView(with entity: HTNotesViewEntity) -> some View {
        NavigationView {
            
            VStack {
                
                NavigationLink(destination: HTNoteReviewView(viewModel: HTNoteReviewViewModel()), isActive: $showHome) {
                    EmptyView()
                }
                
                HStack {
                    Button {
                        // TODO: back
                    } label: {
                        Text("Back")
                            .foregroundColor(Colors.primary_green.color)
                            .font(.callout)
                    }
                    
                    Spacer()
                    
                    Text("Compose")
                        .foregroundColor(.white)
                        .font(.bold(.title)())
                    
                    Spacer()
                }
                TextEditor(text: $note)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Colors.textMediumGray.color)
                    .background(.clear)
                
                
                HTButton(entity: HTButtonViewEntity(title: "Send",
                                                    buttonColor: Colors.primary_green.color,
                                                    buttonTextColor: .white)) {
                    var entity = entity
                    entity.note = $note
                    showHome = true
                }.cornerRadius(HTMetrics.medium)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HTNotesView_Previews: PreviewProvider {
    static var previews: some View {
        HTNotesView(viewModel: HTNotesViewModel(note: ""))
    }
}
