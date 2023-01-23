//
//  Memo.swift
//  Memo
//
//  Created by Jihee hwang on 2023/01/23.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    let insertDate: Date
    @Published var content: String
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
