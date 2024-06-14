//
//  NewFilmView.swift
//  Movieplanner
//
//  Created by Роман on 06.06.2024.
//

import SwiftUI
import PhotosUI


struct NewFilmView: View {
    
    @StateObject var vm: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var isPresented: Bool = false

    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
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
                if vm.pickerResult.isEmpty {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Color.gray
                            .cornerRadius(8)
                            .frame(width: 158, height: 251)
                    }
                    .sheet(isPresented: $isPresented, content: {
                        PhotoPicker(configuration: self.config, pickerResult: $vm.pickerResult, isPresented: $isPresented)
                    })
                } else {
                    Image(uiImage: vm.pickerResult.first!)
                        .resizable()
                        .cornerRadius(8)
                        .frame(width: 158, height: 251)
                }
                
       
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
                        ganreIView(title: "DRAMA").onTapGesture {vm.genreDrame = true}
                        ganreIView(title: "DOCUMENTARY").onTapGesture {vm.genreDocumentary = true}
                        ganreIView(title: "ACTION").onTapGesture {vm.genreAction = true}
                        ganreIView(title: "BIOGRAPHY").onTapGesture {vm.genreBiography = true}
                        ganreIView(title: "MUSIC").onTapGesture {vm.genreMusic = true}
                    }
                }
                Spacer()
                
                //MARK: - Add Button
                Button(action: {
                    vm.addFilm()
                    vm.addAllgenre()
                    vm.clear()
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
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    NewFilmView(vm: ViewModel())
//}
