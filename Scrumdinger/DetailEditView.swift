//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 29/03/2023.
//
import SwiftUI

struct DetailEditView: View {
    @Binding var data: DailyScrum.Data
    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            Section {
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5 ... 30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(data.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }
             header: {
                Text("Meeting info")
            }
            Section {
                ForEach(data.attendees) {
                    Text($0.name)
                }.onDelete {
                    data.attendees.remove(atOffsets: $0)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        data.attendees.append(DailyScrum.Attendee(name: newAttendeeName))
                        newAttendeeName = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            } header: {
                Text("Attendees")
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        let data = DailyScrum.sampleData.first!.data
        DetailEditView(data: .constant(data))
    }
}
