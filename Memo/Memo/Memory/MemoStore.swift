//
//  MemoStore.swift
//  Memo
//
//  Created by Jihee hwang on 2023/01/23.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Content1", insertDate: Date.now),
            Memo(content: "Content2", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "Content3", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "Content4", insertDate: Date.now.addingTimeInterval(3600 * -72))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else { return }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        set.forEach { list.remove(at: $0) }
    }
}
