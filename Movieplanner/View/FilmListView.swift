//
//  FilmListView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct FilmListView: View {
    @State private var isOn = false
    @StateObject var vm = ViewModel()
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
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    ScrollView {
                        ForEach(vm.films) { film in
                            FilmCellView(film: film)
                        }
                    }
                    HStack {
                        Spacer()
                        CircleButtonView()
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    FilmListView()
}
