//
//  Film+CoreDataProperties.swift
//
//
//  Created by Роман on 17.06.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Film)
public class Film: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film")
    }

    @NSManaged public var foto: UIImage?
    @NSManaged public var releaseYear: String?
    @NSManaged public var title: String?
    @NSManaged public var viewed: Bool
    @NSManaged public var genre: NSSet?

}

// MARK: Generated accessors for genre
extension Film {

    @objc(addGenreObject:)
    @NSManaged public func addToGenre(_ value: Genre)

    @objc(removeGenreObject:)
    @NSManaged public func removeFromGenre(_ value: Genre)

    @objc(addGenre:)
    @NSManaged public func addToGenre(_ values: NSSet)

    @objc(removeGenre:)
    @NSManaged public func removeFromGenre(_ values: NSSet)

}

extension Film : Identifiable {

}
