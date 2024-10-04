//
//  AlbumRepository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//

import Foundation
import IdentifiedCollections
import Dependencies

class AlbumRepository: Repository {
    typealias T = Album
    
    @Dependency(\.uuid) var uuid
    
    func get(searchTerm: String, limit: Int = 20) async throws -> IdentifiedArrayOf<T> {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(limit)") else {
            return .init(uniqueElements: [])
        }
                
        let (data, _) = try await URLSession.shared.data(from: url)
        var ar: AlbumResult = .init(resultCount: 0, results: [])
        do {
            let albumResult = try JSONDecoder().decode(AlbumResult.self, from: data)
            ar = albumResult
        } catch {
            print("Error decoding album result: \(error)")
        }
        return IdentifiedArrayOf<T>(
            uniqueElements: ar.results.map {
            Album(
                id: self.uuid(),
                artistName: $0.artistName,
                collectionName: $0.collectionName
            )
        }
        )
    }
}
