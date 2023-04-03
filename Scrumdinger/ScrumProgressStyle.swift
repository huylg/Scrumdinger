//
//  ScrumProgressStyle.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 02/04/2023.
//

import SwiftUI

struct ScrumProgressStyle: ProgressViewStyle {
    let theme: Theme
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
                
            if #available(iOS 15.0, *){
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}

struct ScrumProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgressStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits)
    }
}
