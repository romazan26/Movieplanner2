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
        NavigationView{
            ZStack {
                //MARK: - Backgroung
                Color.background.ignoresSafeArea()
                
                VStack {
                    
                    //MARK: - Toolbar
                    HStack {
                        Text("Film list")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .bold))
                        Toggle("", isOn: $isOn)
                            .toggleStyle(CustonToggleStyle())
                            .padding(.horizontal)
                        Image(.settings)
                            .resizable()
                            .frame(width: 28,height: 28)
                    }
                    Spacer()
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                        
                        //MARK: - Film List
                        ScrollView {
                            ForEach(vm.films) { film in
                                FilmCellView(film: film)
                            }
                        }
                        
                        //MARK: - Create film button
                        HStack {
                            Spacer()
                            NavigationLink {          
                                NewFilmView(vm: vm)
                            } label: {
                                CircleButtonView()
                            }
                        }
                    }
                }.padding()
            }
        }
        .onAppear(perform: {
            print("vm.films: \(vm.films)")
            print("vm.genre: \(vm.genres)")
        })
    }
}

#Preview {
    FilmListView()
}
