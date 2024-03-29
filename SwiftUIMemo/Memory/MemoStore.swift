//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/29/24.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello",insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    //add
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    //update
    func update(memo:Memo?,content:String) {
        guard let memo = memo else {return}
        memo.content = content
        
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    //IndexSet: 정수 값의 집합을 나타내며, 일반적으로 컬렉션의 인덱스를 저장하거나 전달하는 데 사용된다
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
    
    
}
