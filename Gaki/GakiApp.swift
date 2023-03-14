//
//  GakiApp.swift
//  Gaki
//
//  Created by 間口秀人 on 2022/07/19.
//

import SwiftUI

@main
struct GakiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShareData())
        }
    }
}
