//
//  HTHomeView.swift
//  HealthTrackr
//
//  Created by Daniel Gomes Xavier on 21/11/23.
//

import SwiftUI
import Common
import Charts

struct HTHeartRateEntity: Hashable {
    let id = UUID()
    let time: Int
    let value: Int
}

struct HTNotesEntity: Hashable {
    let id = UUID()
    let note: String
    let icon: String
}

struct HTMeasureEntity: Hashable {
    let id = UUID()
    let icon: String
    let message: String
    let action: HTMeasureAction
    
    enum HTMeasureAction {
        case heartRate
        case exercise
    }
}

struct HTHomeView: View {
    
    @Binding var showLastNote: Bool
    @Binding var showHeartRate: Bool
    
    @State private var showManuallyDataView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: HTManuallyDataView(viewModel: HTManuallyDataViewModel()), isActive: $showManuallyDataView) {
                    EmptyView()
                }
                
                ZStack {
                    VStack(spacing: HTMetrics.medium) {
                        HStack {
                            Text("Summary")
                                .font(.bold(.title)())
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            Button {
                                // TODO: go to profile
                            } label: {
                                Image(systemName: "person.circle")
                                    .foregroundColor(Colors.primary_green.color)
                                    .font(.title)
                            }

                        }
                        
                        headerView()
                        
                        notesView()
                        
                        measureView()
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        VStack(spacing: HTMetrics.small) {
            Group {
                headerTextInformation("Today's data")
                
                HStack {
                    headerTextInformation("Mood")
                    
                    Spacer()
                    
                    Image("smilling-emoji")
                        .foregroundColor(Colors.primary_green.color)
                }
                
                HStack {
                    headerTextInformation("Workout (Stand Time)")
                    
                    Spacer()
                    
                    headerTextInformation(showHeartRate ? "60'" : "0'")
                }
                
                HStack {
                    headerTextInformation("Steps")
                    
                    Spacer()
                    
                    headerTextInformation(showHeartRate ? "900" : "0")
                }
                
                if showHeartRate {
                    chartCompleted()
                } else {
                    chart()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        .background(Colors.darkBackground.color)
        .cornerRadius(HTMetrics.little)
    }
    
    @ViewBuilder
    private func headerTextInformation(_ message: String) -> some View {
        Text(message)
            .font(.bold(.callout)())
            .foregroundColor(Colors.textLightGray.color)
            .frame(alignment: .leading)
    }
    
    @ViewBuilder
    private func chart() -> some View {
        let data = [
            HTHeartRateEntity(time: 01, value: 67),
            HTHeartRateEntity(time: 02, value: 72),
            HTHeartRateEntity(time: 03, value: 68),
            HTHeartRateEntity(time: 04, value: 87),
            HTHeartRateEntity(time: 05, value: 80),
            HTHeartRateEntity(time: 06, value: 69),
            HTHeartRateEntity(time: 07, value: 73),
            HTHeartRateEntity(time: 08, value: 68),
            HTHeartRateEntity(time: 09, value: 92)
        ]
        Chart {
            ForEach(data, id: \.self) {
                PointMark(x: .value("Heart Rate", $0.time),
                          y: .value("Value", $0.value))
            }
        }
        .padding()
        .foregroundColor(.red)
        .background(Colors.chartBackground.color)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .cornerRadius(HTMetrics.little)
        .chartXAxisLabel {
            Text("Time")
                .foregroundColor(Colors.darkBackground.color)
        }
        .chartYAxisLabel {
            Text("Heart Rate")
                .foregroundColor(Colors.darkBackground.color)
        }
    }
    
    @ViewBuilder
    private func chartCompleted() -> some View {
        let data = [
            HTHeartRateEntity(time: 01, value: 67),
            HTHeartRateEntity(time: 02, value: 72),
            HTHeartRateEntity(time: 03, value: 68),
            HTHeartRateEntity(time: 04, value: 87),
            HTHeartRateEntity(time: 05, value: 80),
            HTHeartRateEntity(time: 06, value: 69),
            HTHeartRateEntity(time: 07, value: 73),
            HTHeartRateEntity(time: 08, value: 68),
            HTHeartRateEntity(time: 09, value: 92),
            HTHeartRateEntity(time: 10, value: 71)
        ]
        
        Chart {
            ForEach(data, id: \.self) {
                PointMark(x: .value("Heart Rate", $0.time),
                          y: .value("Value", $0.value))
            }
        }
        .padding()
        .foregroundColor(.red)
        .background(Colors.chartBackground.color)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .cornerRadius(HTMetrics.little)
        .chartXAxisLabel {
            Text("Time")
                .foregroundColor(Colors.darkBackground.color)
        }
        .chartYAxisLabel {
            Text("Heart Rate")
                .foregroundColor(Colors.darkBackground.color)
        }
    }
    
    @ViewBuilder
    private func notesView() -> some View {
        let notes = [
            HTNotesEntity(note: "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
                          icon: "neutral-emoji")]
        
        VStack(spacing: HTMetrics.small) {
            HStack {
                Text("Notes")
                    .font(.bold(.title3)())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: HTNotesView(viewModel: HTNotesViewModel(note: ""))) {
                    Image(systemName: "plus")
                        .foregroundColor(Colors.textLightGray.color)
                        .font(.title)
                }

            }
            
            VStack {
                ForEach(notes, id: \.self) {
                    notesCell($0)
                }
                
                if showLastNote {
                    notesCell(HTNotesEntity(note: "Animado!", icon: "grinning-emoji"))
                }
            }
            .background(.clear)
            .cornerRadius(HTMetrics.little)
        }
    }
    
    @ViewBuilder
    private func notesCell(_ entity: HTNotesEntity) -> some View {
        HStack {
            Text(entity.note)
                .lineLimit(2)
                .foregroundColor(Colors.textLightGray.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
                        
            Image(entity.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Colors.primary_green.color)
                .frame(width: HTMetrics.big, height: HTMetrics.big, alignment: .center)
                .padding()
        }
        .background(Colors.darkBackground.color)
        .cornerRadius(HTMetrics.little)
    }
    
    @ViewBuilder
    private func measureView() -> some View {
        let measureEntities = [
            HTMeasureEntity(icon: "heartrate", message: "80 BPM", action: .heartRate),
            HTMeasureEntity(icon: "fitness", message: "Workout", action: .exercise)
        ]
        
        VStack {
            Text("Measure")
                .font(.bold(.title3)())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            measureSection(measureEntities)
        }
    }
    
    @ViewBuilder
    private func measureSection(_ entities: [HTMeasureEntity]) -> some View {
        let rows = [
            GridItem(.flexible())
        ]
        
        LazyHGrid(rows: rows, spacing: HTMetrics.large) {
            ForEach(entities, id: \.self) { entity in
                measureCard(entity)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func measureCard(_ entity: HTMeasureEntity) -> some View {
        VStack {
            HStack(spacing: HTMetrics.small) {
                Image(entity.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 92, height: 92, alignment: .leading)
                    .padding(.trailing)
                
                Spacer()
            }
            
            
            Text(entity.message)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Colors.textLightGray.color)
            
            Spacer()
        }
        .padding()
        .background(Colors.darkBackground.color)
        .cornerRadius(HTMetrics.small)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            showManuallyDataView = true
        }
    }
}

struct HTHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HTHomeView(showLastNote: Binding<Bool>.constant(true), showHeartRate: Binding<Bool>.constant(true))
    }
}
