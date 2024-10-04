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
    let results: [AlbumJSON]
}

// MARK: - Result
struct AlbumJSON: Codable {
    let wrapperType: String
    let collectionType: String
    let artistID: Int
    let collectionID: Int
    let amgArtistID: Int
    let artistName: String
    let collectionName: String
    let collectionCensoredName: String
    let artistViewURL: String
    let collectionViewURL: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Int
    let copyright: String
    let country: String
    let currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case collectionExplicitness
        case trackCount
        case copyright
        case country
        case currency
        case releaseDate
        case primaryGenreName
    }
}

struct Album: Identifiable, Equatable {
    let id: UUID
    let artistName: String
    let collectionName: String
}

