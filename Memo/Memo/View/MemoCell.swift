//
//  MemoCell.swift
//  Memo
//
//  Created by Jihee hwang on 2023/01/23.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1) // 몇줄로 표시할것인가
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
    
    init(memo: Memo) {
        self.memo = memo
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test")) // Dummy 전달
    }
}
