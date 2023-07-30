//
//  BasesSwiftDataApp.swift
//  BasesSwiftData
//
//  Created by David Grammatico on 30/07/2023.
//

import SwiftUI
import SwiftData

@main
struct BasesSwiftDataApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
