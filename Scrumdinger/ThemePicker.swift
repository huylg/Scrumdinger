//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 30/03/2023.
//

import SwiftUI
    
struct ThemePicker: View {
    
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) {
                ThemeView(theme: $0)
                    .tag($0)
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.buttercup))
    }
}
