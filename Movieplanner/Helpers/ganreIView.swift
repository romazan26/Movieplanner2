//
//  ganreIView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct ganreIView: View {
    var title = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .foregroundStyle(Color(.tougleback))
            Text(title)
                .font(.system(size: 14, weight: .heavy))
                .foregroundStyle(.white)
                .padding(8)
                
        }.frame(height: 40)
    }
}

#Preview {
    ganreIView()
}
