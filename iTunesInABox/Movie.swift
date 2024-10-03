//
//  MovieResult.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/2/24.
//


import Foundation
import SwiftUINavigation

// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable {
    let wrapperType: String
    let kind: String
    let artistID: Int?
    let trackID: Int
    let artistName: String
    let trackName: String
    let trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let trackPrice: Double
    let releaseDate: Date
    let collectionExplicitness: String
    let trackExplicitness: String
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let contentAdvisoryRating: String
    let shortDescription: String
    let longDescription: String
    let trackRentalPrice: Double?
    let collectionHDPrice: Double?
    let trackHDPrice: Double?
    let trackHDRentalPrice: Double?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
    }
}
