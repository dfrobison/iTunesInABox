//
//  Repository.swift
//  iTunesInABox
//
//  Created by Doug Robison on 10/3/24.
//
import Foundation

protocol Repository {
    associatedtype T

    func get() async throws -> [T]
}
