//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 29/03/2023.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    
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
                
            } label: {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")

        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        let scrums = DailyScrum.sampleData
        NavigationView {
            ScrumsView(scrums: .constant(scrums))
        }
    }
}
