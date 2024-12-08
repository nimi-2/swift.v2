//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var model = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}
