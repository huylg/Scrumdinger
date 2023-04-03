//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 02/04/2023.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
         speakers.firstIndex { !$0.isCompleted }
    }
    
    private var isLastSpeaker: Bool {
        speakers.allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        if let speakerNumber = speakerNumber {
            return "Speaker \(speakerNumber) of \(speakers.count)"
        }
        return "No more speakers"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }

            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        let speakers = DailyScrum.sampleData.first!.attendees.speakers
        MeetingFooterView(speakers: speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
