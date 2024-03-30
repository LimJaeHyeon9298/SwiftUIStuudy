//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/30/24.
//

import SwiftUI

struct DetailView: View {
    
    //ObservedObject로 선언하면 Publised 값이 변할떄마다 View가 자동으로 업데이트 됨
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                   
                    
                    Text(memo.insertDate,style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                  
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

#Preview {
    NavigationView {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
   
}
