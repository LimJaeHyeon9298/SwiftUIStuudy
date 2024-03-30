//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/29/24.
//

import SwiftUI

struct MainListView: View {
    
    

    // View 생성 시점 공유 데이터 확인 후 속성 일치하면 초기화 하나의 데이터 여러 뷰 공유할때 사용
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    
    
    var body: some View {
        
        NavigationView {
            List(store.list) { memo in
                
                NavigationLink {
                    DetailView(memo: memo)
                        
                } label: {
                    MemoCell(memo: memo)
                }
            }
        
            .listStyle(.plain)
            .navigationTitle("내 메모")
        
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented:$showComposer) {
                ComposeView()
            }
        }
        // toolbar 사진 안보이는 에러 해결
        .navigationViewStyle(StackNavigationViewStyle())
     
        
        
    }
}

#Preview {
    MainListView()
        .environmentObject(MemoStore())
}





