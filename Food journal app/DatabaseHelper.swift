//
//  DatabaseHelper.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class DatabaseHelper {
    
    static let shared = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveFoodEntry(image: UIImage, description: String, date: Date) {
        
        guard let imageData = image.pngData() else { return }
        
        let foodEntry = FoodEntry(context: context)
        foodEntry.foodImage = imageData
        foodEntry.entryDescription = description
        foodEntry.entryDate = date
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func fetchFoodEntry() -> Array<FoodEntry> {
        
        var foodJournal = Array<FoodEntry>()
        
        do {
            foodJournal = try context.fetch(FoodEntry.fetchRequest()) as! Array<FoodEntry>
            print("Data fetched")
            
        } catch {
            print(error)
        }
        
        return foodJournal
    }
}
