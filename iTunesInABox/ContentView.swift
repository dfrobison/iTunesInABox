//
//  ContentView.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/2/24.
//

import SwiftUI
import ComposableArchitecture




struct ContentView: View {
    @Bindable var store: StoreOf<iTunesInABoxAppFeature>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.albums) { album in
                    Text(album.artistName)
                }
            }
            .searchable(text: $store.albumSearchTerm, prompt: Text("Search for an album"))
            .navigationTitle("iTunes in a Box")
        }
        
        
    }
}

#Preview {
    //  ContentView()
}
