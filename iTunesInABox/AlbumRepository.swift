//
//  AlbumRepository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//

import Foundation





class AlbumRepository: Repository {
    static let url: URL = .init(string: "https://itunes.apple.com/search?term=album&media=music&limit=50")!
    
    typealias T = Album
    
    func get() async throws -> [T] {
        let (data, _) = try await URLSession.shared.data(from: AlbumRepository.url)
        let albumResult = try JSONDecoder().decode(AlbumResult.self, from: data)
        return albumResult.results.map {
            Album(
                artistName: $0.artistName,
                collectionName: $0.collectionName
            )
        }
    }
}
