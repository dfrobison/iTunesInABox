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
        var albumSearchTerm: String = ""
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case albumsResponse(Result<IdentifiedArrayOf<Album>, any Error>)
    }
    
    @Dependency(\.mainQueue) var mainQueue
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce {
            state,
            action in
            switch action {
            case let .albumsResponse(.success(albums)):
                state.albums = albums
                return .none
                
            case .albumsResponse(.failure):
                return .none
                
            case .binding(\.albumSearchTerm):
                enum CancelID { case search }
                
                return .run {[searchTerm = state.albumSearchTerm] send in
                    await send(
                        .albumsResponse(
                            Result {
                                try await RespositoryManager(AlbumRepository()).get(searchTerm: searchTerm)
                            })
                    )
                }
                .debounce(id: CancelID.search, for: 0.5, scheduler: self.mainQueue)
            case .binding(_):
                return .none
            }
            
        }
    }
}
