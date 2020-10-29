//
//  CoreDataManager.swift
//  FitGoal
//
//  Created by Christian Slanzi on 25.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation
import CoreData

// MARK: - DataManager Implementation
class CoreDataManager {
    
    // MARK: - Stored Properties
    let persistentContainer: NSPersistentContainer!
    
    public lazy var mainContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    // MARK: Init with dependency
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
}

extension CoreDataManager: DataManager {
    func create<T>(_ model: T.Type, completion: @escaping ((T) -> Void)) throws where T: Storable {
        // TODO
    }
    
    func save(object: Storable) throws {
        // TODO
    }
    
    func update(object: Storable) throws {
        // TODO
    }
    
    func delete(object: Storable) throws {
        // TODO
    }
    
    func deleteAll<T>(_ model: T.Type) throws where T: Storable {
        // TODO
    }
    
    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?, completion: (([T]) -> Void)) where T: Storable {
        // TODO
    }
        
}
