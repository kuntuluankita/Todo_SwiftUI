//
//  Todo_SwiftUIApp.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 24/03/25.
//

import SwiftUI
import FirebaseCore

@main
struct Todo_SwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
