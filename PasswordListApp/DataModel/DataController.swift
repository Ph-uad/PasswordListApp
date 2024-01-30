//
//  DataController.swift
//  PasswordListApp
//
//  Created by ツ水 on 03/01/2024.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let container  = NSPersistentContainer(name: "PasswordModel")
    
    
    init(){
        container.loadPersistentStores{desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context : NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved!!!")
        }catch{
            print("Data Cannot be saved")
        }
    }
    
    func addPassword(app: String, password : String, username : String , context : NSManagedObjectContext ){
        let pass = Password(context: context)
        pass.id = UUID()
        pass.date = Date()
        pass.app = app
        pass.username = username
        pass.password = password

        save(context: context)
    }
    
    func updatePassword(pass : Password, password : String, app : String, context : NSManagedObjectContext ){
        pass.date = Date()
        pass.app = app
        pass.password =  password
        
        save(context: context)
    }
}
