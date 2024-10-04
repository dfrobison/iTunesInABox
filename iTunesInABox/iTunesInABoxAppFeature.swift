//
//  iTunesInABoxAppFeature.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//

import ComposableArchitecture
import IdentifiedCollections

@Reducer
struct iTunesInABoxAppFeature {
    
    @ObservableState
    struct State: Equatable {
        var albums: IdentifiedArrayOf<Album> = []
    }
    
    enum Action {
        case loadData
        case albumsResponse(Result<IdentifiedArrayOf<Album>, any Error>)
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
                case .loadData:
                    return .run { send in
                        await send(.albumsResponse(Result {
                            try await AlbumRepository().get()
                        }))
                        
                    }
                    
                case .albumsResponse(let result):
                    
                    if case .success(let albums) = result {
                        state.albums = albums
                        
                    }
                    
                    return .none
            }
        }
    }
}
