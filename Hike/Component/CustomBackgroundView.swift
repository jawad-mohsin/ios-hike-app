//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by App Tycoons on 5/28/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.customGreenLight, .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)

        }
        .padding()
    }
}

#Preview {
    CustomBackgroundView()
}
