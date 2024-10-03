//
//  AlbumResult.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/2/24.
//


import Foundation


// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5

// MARK: - AlbumResult
struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

// MARK: - Result
struct Album: Codable {
    enum CollectionExplicitness: String, Codable {
        case explicit = "explicit"
        case notExplicit = "notExplicit"
    }
    
    enum CollectionType: String, Codable {
        case album = "Album"
    }
    
    enum Country: String, Codable {
        case usa = "USA"
    }
    
    enum Currency: String, Codable {
        case usd = "USD"
    }
    
    enum WrapperType: String, Codable
    {
        case collection = "collection"
    }

    let wrapperType: WrapperType
    let collectionType: CollectionType
    let artistID: Int
    let collectionID: Int
    let amgArtistID: Int?
    let artistName: String
    let collectionName: String
    let collectionCensoredName: String
    let artistViewURL: String
    let collectionViewURL: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: CollectionExplicitness
    let trackCount: Int
    let copyright: String
    let country: Country
    let currency: Currency
    let releaseDate: Date
    let primaryGenreName: String
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, contentAdvisoryRating
    }
}

