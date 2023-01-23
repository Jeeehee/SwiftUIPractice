//
//  MemoApp.swift
//  Memo
//
//  Created by Jihee hwang on 2023/01/23.
//

import SwiftUI

@main
struct MemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
