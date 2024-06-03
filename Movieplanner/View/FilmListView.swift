//
//  FilmListView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct FilmListView: View {
    @State private var isOn = false
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Film list")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                    Toggle("", isOn: $isOn)
                    Image(.settings)
                        .resizable()
                        .frame(width: 28,height: 28)
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    FilmListView()
}
