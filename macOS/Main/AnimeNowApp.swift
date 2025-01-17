//
//  AnimeNowApp.swift
//  Shared
//
//  Created by ErrorErrorError on 9/2/22.
//

import SwiftUI

@main
struct AnimeNowApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppView(
                store: appDelegate.store
            )
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.expanded)
        .commands {
            CommandGroup(replacing: .newItem) { }
            CommandGroup(after: .appInfo) {
                Button {
                    
                } label: {
                    Text("Check for Updates...")
                }
            }

            CommandGroup(before: .systemServices) {
                Button {
                    
                } label: {
                    Text("Preferences")
                }
            }
        }
    }
}
