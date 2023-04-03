//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 28/03/2023.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map({ Attendee(name: $0) })
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    
    struct Attendee:Identifiable {
        let id: UUID
        let name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title = ""
        var attendees = [Attendee]()
        var lengthInMinutes: Double = 0
        var theme = Theme.seafoam
    }
    
    var data: Data {
        get {
            Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
        }
        
        set {
            self.title = newValue.title
            self.attendees = newValue.attendees
            self.lengthInMinutes = Int(newValue.lengthInMinutes) 
            self.theme = newValue.theme
        }
    }
}

extension DailyScrum {
    
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Daria"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
