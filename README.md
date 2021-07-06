# Food journal app
## Introduction
This is a food journal app which is a sugested solution to the codemaster's "<a href="https://www.codementor.io/projects/mobile/food-journal-mobile-app-atx32fsra1">Food journal mobile app</a>".
The user can take a photo of the food he is currently eating and add a description to it. The photo has to be taken using the inbuild camera but easily can this be extended for the photo library as well - so the user can use a photo he was taken before.
All of the entries are displayed in a list on the app's main screen. Each entry consist of the photo, some optional description and the date when it was saved. 
Tapping an food entry in the main view displays a full screen view with detail - those can be tags or location information that can be added to the Core Data model.

## Technologies
The app was written in Swift with no storyboard files which means that the whole user interface was implemented programmatically.
The entries are stored localy on the users device using a Core Data model.
In a future release i want to meet all the requirements given by the codemaster's project which means using the Google's <a href="https://developers.google.com/maps/documentation/places/web-service/overview"> Places API </a> to get the location.

## Screenshots
On the main screen of the app the user can see a list with all entries he made. Each entry has a food's photo, description and date.

<img src="Food%20journal%20app/Images/mainScreen.PNG" width="300">

Tapping the plus sign in the top right corner of the screen opens a new view where the user can create a new entry. In the new view there is a camera button in the navigation bar which tapped opens the camera app and allows the user to take a photo - this can be edited after it's been taken. The description is a optional field and can be leaved empty. The alst thing to do to save the entry is to tab the "Done" button.

<img src="Food%20journal%20app/Images/emptyAddEntry.PNG" width="300"> <img src="Food%20journal%20app/Images/filledAddEntry.PNG" width="300">

Back in the main sceern the user can select an entry from the journal. This causes a detailed view to apear where the user can se a focused view on the entry - here in the future will be displayed the location and the hastags.

<img src="Food%20journal%20app/Images/detailView.PNG" width="300">

## How to save photos using a Core Data model

Because there is no property with a UIImage type in th Core Data i decided to use a "binary data" field to save the photos.
For this method we have to call a method on the image instance which returns the image as a type of "Data".
After that we can normally assign the photo's data to the binary data property.

```swift
class DatabaseHelper {
    
    // A class property used to share an instance of the class itself and acces all methods in place.
    static let shared = DatabaseHelper()
    
    // The context used to save and fatch data from local storage.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // This function is called whenever there is a need of saving a new entry.
    func saveFoodEntry(image: UIImage, description: String, date: Date) {
        
        // Trying to get the image as an Data model.
        guard let imageData = image.pngData() else { return }
        
        // Creating and instance of the Core Data FoodEntry model using the context. The image data is assigned to the imageField which is of binary data type.
        let foodEntry = FoodEntry(context: context)
        foodEntry.foodImage = imageData
        foodEntry.entryDescription = description
        foodEntry.entryDate = date
        
        // Trying to save the new entry.
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    // This function is used to fetch all entries from the local storage.
    func fetchFoodEntry() -> Array<FoodEntry> {
        
        // Decided to create an array which will be returned even if it's empty. This way it is easier to use the method in the table view instead of changing the methods signature for returning an optional array.
        var foodJournal = Array<FoodEntry>()
        
        // Trying to fetch data from the local storage.
        do {
            foodJournal = try context.fetch(FoodEntry.fetchRequest()) as! Array<FoodEntry>
            print("Data fetched")
            
        } catch {
            print(error)
        }
        
        // Returning the array with fetched data.
        return foodJournal
    }
}
```
