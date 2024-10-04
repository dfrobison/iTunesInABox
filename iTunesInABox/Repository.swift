//
//  Repository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//
import Foundation
import IdentifiedCollections

protocol Repository {
    associatedtype T: Identifiable
    
    func get(searchTerm: String, limit: Int) async throws -> IdentifiedArrayOf<T>
}
