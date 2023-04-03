//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 29/03/2023.
//
    
import SwiftUI

struct DetailView: View {
    
    @Binding var scrum: DailyScrum
    
    @State private var data = DailyScrum.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Metting Info")) {
                NavigationLink(destination: {
                   MeetingView(scrum: $scrum)
                }, label: {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                })
                
                    
                HStack {
                    Label("length", systemImage: "clock")
                    Spacer()
                    Text("\(Int(scrum.lengthInMinutes)) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section {
                ForEach(scrum.attendees) { attende in
                    Label(attende.name, systemImage: "person")
                }
            } header: {
                Text("Attendees")
            }
            
            Section {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            } header: {
                Text("History")
            }

        }
        .navigationTitle(scrum.title)
        .toolbar(content: {
            Button {
                isPresentingEditView.toggle()
                data = scrum.data
            } label: {
                Text("Edit")
            }

        })
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem {
                            Button {
                                isPresentingEditView.toggle()
                            } label: {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem {
                            Button {
                                isPresentingEditView.toggle()
                                scrum.data = data
                            } label: {
                                Text("Done")
                            }
                        }

                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            DetailView(scrum: .constant(DailyScrum.sampleData.first!))
        })
        
    }
}
