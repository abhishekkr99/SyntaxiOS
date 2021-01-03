//
//  CoreDataStack.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 22/06/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    static let moduleName = "SyntaxiOS"
    
    let managedObjectModel: NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: moduleName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelUrl)!
    }()
    
    lazy var managedObjectContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.moduleName, managedObjectModel: managedObjectModel)
        return container
    }()
    
    func saveMOCContext() {
        if self.managedObjectContainer.viewContext.hasChanges {
            do {
                try self.managedObjectContainer.viewContext.save()
            } catch {
                fatalError("Error in saving MOC")
            }
        }
    }
}

class OldCoreDataStack: NSObject {
    static let moduleName = "SyntaxiOS"
    
    let managedObjectModel: NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: moduleName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelUrl)!
    }()
    
    lazy var aplicationDocumentDirectory: URL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    }()
    
    lazy var persistanceStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let persistanceStoreUrl = self.aplicationDocumentDirectory.appendingPathComponent("\(OldCoreDataStack.moduleName).sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistanceStoreUrl, options: [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption:true])
        } catch {
            
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.persistanceStoreCoordinator
        return moc
    }()
    
    func saveMOCContext() {
        if self.managedObjectContext.hasChanges {
            do {
                try self.managedObjectContext.save()
            } catch {
                fatalError("Error in saving MOC")
            }
        }
    }
}
