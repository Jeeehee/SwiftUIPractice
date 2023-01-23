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
            // 여기서 리턴하는 뷰가 첫 뷰
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
