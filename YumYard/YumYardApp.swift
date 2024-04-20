//
//  YumYardApp.swift
//  YumYard
//
//  Created by Diệu Anh on 4/19/24.
//

import SwiftUI
import FirebaseCore

@main
struct YumYardApp: App {
    
    @State private var authManager: AuthManager
    
    init() { // <-- Add an init
        FirebaseApp.configure()
        authManager = AuthManager()
       }
    
    var body: some Scene {
            WindowGroup {
                RootView()
                    .environment(authManager)
            }
        }
    }

    struct RootView: View {
        @Environment(AuthManager.self) var authManager
        
        var body: some View {
            if authManager.user != nil {
                // User is logged in
                MainContentView()
            } else {
                // User is not logged in
                WelcomeView()
            }
        }
    }

    struct MainContentView: View {
        @Environment(AuthManager.self) var authManager

        var body: some View {
            Text("Welcome, \(authManager.user?.email ?? "Guest")!")
            Button("Sign Out") {
                authManager.signOut()
            }
        }
    }
