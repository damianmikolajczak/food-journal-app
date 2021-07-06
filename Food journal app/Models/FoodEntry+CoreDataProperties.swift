//
//  FoodEntry+CoreDataProperties.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//
//

import Foundation
import CoreData


extension FoodEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodEntry> {
        return NSFetchRequest<FoodEntry>(entityName: "FoodEntry")
    }

    @NSManaged public var entryDescription: String?
    @NSManaged public var entryDate: Date?
    @NSManaged public var foodImage: Data?

}

extension FoodEntry : Identifiable {

}
