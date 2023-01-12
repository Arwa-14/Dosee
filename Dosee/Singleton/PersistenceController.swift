//
//  PersistenceController.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Stalarm") //Dosee
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
