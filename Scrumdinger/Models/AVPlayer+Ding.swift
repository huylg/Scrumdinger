//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 02/04/2023.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static var sharedDingPlayer: AVPlayer {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file") }
        return AVPlayer(url: url)
    }
}
