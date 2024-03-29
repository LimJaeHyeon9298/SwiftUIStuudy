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
    
    
    var body: some View {
        
        NavigationView {
            List(store.list) { memo in
                VStack(alignment:.leading) {
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(memo.insertDate,style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
               
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
        }
        
      
    }
}

#Preview {
    MainListView()
        .environmentObject(MemoStore())
}
