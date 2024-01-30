//
//  PasswordListAppApp.swift
//  PasswordListApp
//
//  Created by ツ水 on 03/01/2024.
//

import SwiftUI

@main
struct PasswordListAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
