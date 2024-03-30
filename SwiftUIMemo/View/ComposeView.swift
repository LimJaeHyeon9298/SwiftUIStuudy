//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/30/24.
//

import SwiftUI

struct ComposeView: View {
    
    var memo: Memo? = nil
    
    @EnvironmentObject var store : MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle( memo != nil ? "메모 편집": "새 메모")
            .navigationBarTitleDisplayMode(.inline)
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
                        
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
                
                
                
            }
            
            
        }
    }
}

#Preview {
    ComposeView()
        .environmentObject(MemoStore())
}
