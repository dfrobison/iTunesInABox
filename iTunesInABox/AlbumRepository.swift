//
//  AlbumRepository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//

import Foundation
import IdentifiedCollections
import Dependencies


enum RespositoryError: Error {
    case invalidJSON
}


func getResult<T>(_ type: T.Type, url: URL) async throws -> T where T: Decodable {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    } catch {
        throw RespositoryError.invalidJSON
    }
}


class RespositoryManager {
   let repository = AlbumRepository()
    
    enum RMedia {
        case albums
    }
    
    let rMedia: RMedia
    
    init(media: RMedia) {
        self.rMedia = media
    }
    
    func get<R: Repository>(_ type: R.Type, searchTerm: String, limit: Int = 20) async throws ->  [R.T]  {
        
        switch rMedia {
            case .albums:
//                let rep = AlbumRepository()
                return try await R.T(from: self).get(searchTerm: searchTerm, limit: limit)
        }
       // return  try await repository.get(searchTerm: searchTerm, limit: limit)
    }
}

struct AlbumRepository: Repository {
    typealias T = Album
    
    @Dependency(\.uuid) var uuid
    
    func get(searchTerm: String, limit: Int = 20) async throws -> [T] {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(limit)") else {
            return []
        }
            
        do {
            let result = try await getResult(AlbumResult.self, url: url)
            return  result.results.map {
                Album(
                    id: self.uuid(),
                    artistName: $0.artistName,
                    collectionName: $0.collectionName
                )
            }
//            return IdentifiedArrayOf<T>(
//                uniqueElements: result.results.map {
//                    Album(
//                        id: self.uuid(),
//                        artistName: $0.artistName,
//                        collectionName: $0.collectionName
//                    )
//                }
//            )
        } catch RespositoryError.invalidJSON {
            print("Invalid JSON")
        } catch {
            print("Another error: \(error)")
        }
        
//        let (albumResultData, _) = try await URLSession.shared.data(from: url)
//        var albumResult: AlbumResult = .init(resultCount: 0, results: [])
//        
//        do {
//            albumResult = try JSONDecoder().decode(AlbumResult.self, from: albumResultData)
//        } catch {
//            print("Error decoding album result: \(error)")
//        }
        return []
        
    }
}
