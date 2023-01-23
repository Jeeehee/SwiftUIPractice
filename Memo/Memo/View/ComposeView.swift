//
//  ComposeView.swift
//  Memo
//
//  Created by Jihee hwang on 2023/01/23.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        // 화면이 표시되는 시점의 초기화 코드
                        guard let memo = memo else { return }
                        content = memo.content
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        guard let memo = memo else {
                            store.insert(memo: content)
                            return
                        }
                        store.update(memo: memo, content: content)
    
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
