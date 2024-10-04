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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            List {
                ForEach(store.albums) { album in
                    Text(album.artistName)
                }
            }
            
        }
        .padding()
        .onAppear {
            store.send(.loadData)
            
        }
        
    }
}

#Preview {
  //  ContentView()
}
