//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 29/03/2023.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scencePhase
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    
    let saveActions: ()->Void
    
    
    var body: some View {
        List($scrums) { $scrum in
            NavigationLink(destination: {
               DetailView(scrum: $scrum)
            }, label: {
                CardView(scrum: scrum)
            })
            .listRowBackground(scrum.theme.mainColor)
        }
        .navigationTitle("Daily Scrum")
        .toolbar {
            Button {
                isPresentingNewScrumView = true
            } label: {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")

        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
                
            }
        }
        .onChange(of: scencePhase) { newValue in
           if newValue == .inactive { saveActions() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        let scrums = DailyScrum.sampleData
        NavigationView {
            ScrumsView(scrums: .constant(scrums), saveActions: {})
        }
    }
}
