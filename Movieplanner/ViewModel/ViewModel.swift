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
    
    
    @Published var simpleTitle = ""
    @Published var simpleRelease = ""
    @Published var simpleFilm: Film!
    
    init(){
       
        getFilms()
        getGenre()
       
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
    //MARK: - UPDATA
    func updataFilm(with id: ObjectIdentifier){
        let request = NSFetchRequest<Film>(entityName: "Film")
        do{
            films = try manager.context.fetch(request)
            
            let film = films.first(where: { $0.id == id })
            film?.title = simpleTitle
            film?.releaseYear = simpleRelease
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    //MARK: - SAVE
    func save(){
        
        films.removeAll()
        self.manager.save()
        self.getFilms()
        self.getGenre()
    }
}
