//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 임재현 on 3/29/24.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // 처음 실행되는 뷰
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
