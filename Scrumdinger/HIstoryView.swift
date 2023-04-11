//
//  HIstoryView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 07/04/2023.
//

import SwiftUI

struct HIstoryView: View {
    
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let history = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(history)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString :String {
        
        ListFormatter.localizedString(byJoining: attendees.map({ $0.name }))
    
    }
}

struct HIstoryView_Previews: PreviewProvider {
    
    static var history: History {
        History(attendees: [DailyScrum.Attendee(name: "Jon"), DailyScrum.Attendee(name: "Darla"), DailyScrum.Attendee(name: "Luis"), ], lengthInMinutes: 10, transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis's PR and met with the design team to finalize the UI...")
    }
    
    static var previews: some View {
        HIstoryView(history: history)
    }
}
