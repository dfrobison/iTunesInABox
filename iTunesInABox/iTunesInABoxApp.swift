//
//  iTunesInABoxApp.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/2/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct iTunesInABoxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: iTunesInABoxAppFeature.State()) { iTunesInABoxAppFeature() })
        }
    }
}
