//
//  QueueFilmCellView.swift
//  Movieplanner
//
//  Created by Роман on 09.06.2024.
//

import SwiftUI


struct QueueFilmCellView: View {

    @ObservedObject var vm: ViewModel
    
    let film: Film
    
    var body: some View {
        HStack {
            
            //MARK: - Image
            if let imgData = film.foto{
                Image(uiImage: UIImage(data: imgData)!)
                    .resizable()
                    .frame(width: 135)
            }
            VStack(alignment: .leading) {
                
                //MARK: - Title
                Text("\(film.title ?? "no title")")
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .heavy))
                Text("\(film.releaseYear ?? "no year")")
                    .foregroundStyle(.gray)
                    .font(.system(size: 17, weight: .heavy))
                
                //MARK: - Ganre
                if let genres = film.genre?.allObjects as? [Genre] {
                    genreListView(items: vm.createGenreList(genres: genres))
                }
                
                Spacer()

                    //MARK: - Add to viewed button
                    Button {
                        vm.updataFilmStatus(with: film.id)
                        vm.createViewedFilms()
                        vm.createQueueFilms()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.button)
                            Text("Add to viewed")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .bold))
                        }.frame(width: 192, height: 47)
                    }
            }
        }
        
        .frame(width: 330, height: 250)
    }
    }


#Preview {
    QueueFilmCellView(vm: ViewModel(), film: Film())
}
