//
//  CircleButtonView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct CircleButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.button)
                .frame(width: 66)
            Text("+")
                .font(.system(size: 35))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    CircleButtonView()
}
