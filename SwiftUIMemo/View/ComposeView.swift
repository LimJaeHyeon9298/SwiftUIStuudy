//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/30/24.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store : MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 메모")
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
                        store.insert(memo: content)
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
