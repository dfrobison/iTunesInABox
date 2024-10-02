//
//  Song.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/2/24.
//

import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5

// MARK: - SongResult
struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable {
    enum Explicitness: String, Codable {
        case explicit = "explicit"
        case notExplicit = "notExplicit"
    }
    
    enum Country: String, Codable {
        case usa = "USA"
    }
    
    enum Currency: String, Codable {
        case usd = "USD"
    }
    
    enum Kind: String, Codable {
        case song = "song"
    }
    
    enum WrapperType: String, Codable {
        case track = "track"
    }

    let wrapperType: WrapperType
    let kind: Kind
    let artistID: Int
    let collectionID: Int
    let trackID: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL: String
    let collectionViewURL: String
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: Date
    let collectionExplicitness: Explicitness
    let trackExplicitness: Explicitness
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let isStreamable: Bool
    let collectionArtistName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
}

