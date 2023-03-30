//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 30/03/2023.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds < 0 else {
            return 1
        }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
     
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                        Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.file")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
