//
//  SwiftUIView.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import SwiftUI

struct FilmCellView: View {
    
    let film: Film
    @StateObject var vm: ViewModel
    var body: some View {
        HStack(spacing: 10) {
            
            //MARK: - Image
            if let imgData = film.foto{
                Image(uiImage: imgData)
                    .resizable()
                    .frame(width: 135)
                    .cornerRadius(8)
            }else {
                Color.gray
                    .frame(width: 135)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                
                //MARK: - Title
                Text("\(film.title ?? "no title")")
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .heavy))
                Text(film.releaseYear ?? "")
                    .foregroundStyle(.gray)
                    .font(.system(size: 17, weight: .heavy))
                
                //MARK: - Ganre
                if let genres = film.genre?.allObjects as? [Genre] {
                    genreListView(items: vm.createGenreList(genres: genres))
                }
                
                Spacer()
                
                HStack{
                    
                    //MARK: - Open card button
                    NavigationLink {
                        //destenation
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 120, height: 47)
                                .foregroundStyle(.button)
                            Text("Open card")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .bold))
                        }
                    }

                    //MARK: - Rating
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("7.5")
                    }
                }
            }
        }
        .frame(width: 330, height: 250)
    }
}

#Preview {
    FilmCellView(film: Film(), vm: ViewModel())
}
