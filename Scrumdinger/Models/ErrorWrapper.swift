//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 03/04/2023.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guildance: String
    
    init(id: UUID = UUID(), error: Error, guildance: String) {
        self.id = id
        self.error = error
        self.guildance = guildance
    }
    
}
