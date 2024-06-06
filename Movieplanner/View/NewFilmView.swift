//
//  NewFilmView.swift
//  Movieplanner
//
//  Created by Роман on 06.06.2024.
//

import SwiftUI

struct NewFilmView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                //MARK: - Toolbar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("New film")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .offset(x: 6)
                    Spacer()
                    Image(.settings)
                        .resizable()
                        .frame(width: 28,height: 28)
                }.padding()
                Spacer()
                Text("Choose a genre/s")
                    .font(.system(size: 16, weight: .heavy))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewFilmView()
}
