//
//  AlbumRepository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//

import Foundation
import IdentifiedCollections


class AlbumRepository: Repository {
    static let url: URL = .init(string: "https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5")!
    
    typealias T = Album
    
    func get() async throws -> IdentifiedArrayOf<T> {
        let (data, _) = try await URLSession.shared.data(from: AlbumRepository.url)
        let albumResult = try JSONDecoder().decode(AlbumResult.self, from: data)
        return IdentifiedArrayOf<T>(
            uniqueElements: albumResult.results.map {
            Album(
                id: UUID(),
                artistName: $0.artistName,
                collectionName: $0.collectionName
            )
        }
        )
    }
}
