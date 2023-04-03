//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 28/03/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums =  DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
