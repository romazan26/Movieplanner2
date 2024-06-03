//
//  ganreIView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct ganreIView: View {
    var title = "COMEDY"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .foregroundStyle(Color(.background))
            Text(title)
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(.white)
                .padding(4)
        }.frame(width: 77, height: 27)
    }
}

#Preview {
    ganreIView()
}
