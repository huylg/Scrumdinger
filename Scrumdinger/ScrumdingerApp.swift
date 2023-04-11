//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 28/03/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums, saveActions: {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guildance: "Try again later.")
                        }
                    }
                    
                })
            }
            .task {
                do {
                    let scrums = try await ScrumStore.load()
                    store.scrums = scrums
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guildance: "Scrumdinger will load example data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: {
                ErrorView(errorWrapper: $0)
            }

        }
    }
}
