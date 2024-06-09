//
//  ViewModel.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import Foundation
import CoreData


final class ViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var films: [Film] = []
    @Published var genres: [Genre] = []
    @Published var filmsQueue: [Film] = []
    @Published var filmsViewed: [Film] = []
    
    
    @Published var simpleTitle = ""
    @Published var simpleRelease = ""
    @Published var simpleFilm: Film!
    
    @Published var genreDrame = false
    @Published var genreDocumentary = false
    @Published var genreAction = false
    @Published var genreBiography = false
    @Published var genreMusic = false
    
    
    init(){
        getFilms()
        getGenre()
       
    }

    //MARK: - Create Viewed List
    func createViewedFilms(){
        filmsViewed.removeAll()
        for film in films {
            if film.viewed {
                filmsViewed.append(film)
            }
        }
    }
    
    //MARK: - Create Queue List
    func createQueueFilms(){
        filmsQueue.removeAll()
        for film in films {
            if !film.viewed {
                filmsQueue.append(film)
            }
        }
    }
    
    //MARK: - GET
    func getFilms(){
        let request = NSFetchRequest<Film>(entityName: "Film")
        
        do {
            films = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getGenre(){
        let request = NSFetchRequest<Genre>(entityName: "Genre")
        do{
            genres = try manager.context.fetch(request)
        }catch let error {
            print("not get tasks: \(error)")
        }
    }
    
    //MARK: - ADD
    func addAllgenre(){
        if genreDrame {addGenre(simpleGenre: "DRAME")}
        if genreDocumentary {addGenre(simpleGenre: "DOCUMENTARY")}
        if genreDrame {addGenre(simpleGenre: "ACTION")}
        if genreDocumentary {addGenre(simpleGenre: "BIOGRAPHY")}
        if genreDocumentary {addGenre(simpleGenre: "MUSIC")}
    }
    func addGenre(simpleGenre: String){
    
            let newGenre = Genre(context: manager.context)
            newGenre.name = simpleGenre
            
            newGenre.film = films.last
       
            save()
        
    }
    
    func addFilm(){
        let newFilm = Film(context: manager.context)
        newFilm.title = simpleTitle
        newFilm.releaseYear = simpleRelease
        simpleFilm = newFilm
        
        save()
        
    }
    //MARK: - UPDATA Status view
    func updataFilmStatus (with id: ObjectIdentifier){
        let request = NSFetchRequest<Film>(entityName: "Film")
        do{
            films = try manager.context.fetch(request)
            
            let film = films.first(where: { $0.id == id })
            film?.viewed = true
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    //MARK: - SAVE
    func save(){
        genres.removeAll()
        films.removeAll()
        
        self.manager.save()
        self.getFilms()
        self.getGenre()
    }
}
