//
//  NewFilmView.swift
//  Movieplanner
//
//  Created by Роман on 06.06.2024.
//

import SwiftUI


struct NewFilmView: View {
    
    @StateObject var vm: ViewModel
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
                }
                
                //MARK: - Image
                Color.gray
                    .cornerRadius(8)
                    .frame(width: 158, height: 251)
                
                //MARK: - Film Title
                CustomTextFieldView(placeholder: "Film title", text: $vm.simpleTitle)
                    .padding(.top)
                    .foregroundStyle(.white)
                //MARK: - Release year
                CustomTextFieldView(placeholder: "Release year", text: $vm.simpleRelease)
                    .foregroundStyle(.white)
        
                HStack {
                    Text("Choose a genre/s")
                        .font(.system(size: 16, weight: .heavy))
                        .padding(.top)
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                //MARK: - Genre
                ScrollView(.horizontal) {
                    HStack{
                        ganreIView(title: "DRAMA").onTapGesture {vm.addGenre(simpleGenre: "DRAMA")}
                        ganreIView(title: "DOCUMENTARY").onTapGesture {vm.addGenre(simpleGenre: "DOCUMENTARY")}
                        ganreIView(title: "ACTION").onTapGesture {vm.addGenre(simpleGenre: "ACTION")}
                        ganreIView(title: "BIOGRAPHY").onTapGesture {vm.addGenre(simpleGenre: "BIOGRAPHY")}
                        ganreIView(title: "MUSIC").onTapGesture {vm.addGenre(simpleGenre: "MUSIC")}
                    }
                }
                Spacer()
                
                //MARK: - Add Button
                Button(action: {
                    vm.updataFilm(with: vm.simpleFilm.id)
                    dismiss()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(.button)
                        Text("Add film")
                            .foregroundStyle(.white)
                    }
                }).frame(width: 349, height: 69)
            }
            .onAppear(perform: {
                vm.addFilm()
            })
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    NewFilmView(vm: ViewModel())
//}
