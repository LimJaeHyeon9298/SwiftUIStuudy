//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/29/24.
//

import Foundation
import SwiftUI
 // Identifiable : 데이터를 리스트에 쉽게 bind 하기 위해
 // ObsevableObject : 뷰를 자동으로 업데이트 하기위해 채택
class Memo: Identifiable, ObservableObject {
    let id: UUID
    // Published 속성 -> bind되어 있는 UI 가 자동으로 업데이트
    @Published var content: String
    let insertDate: Date
    
    init(content:String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
}
