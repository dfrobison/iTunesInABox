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
    
    func get(searchTerm: String, limit: Int)  async throws -> [T]
}

//struct WebArticle: Identifiable {
//    let id: UUID = .init()
//    
//}
//
//struct WebArticle1: Identifiable {
//    let id: UUID = .init()
//    
//}
//
//
//struct BC: Repository {
//    typealias T = WebArticle
//    func get(searchTerm: String, limit: Int) -> IdentifiedArrayOf<T> {
//        .init(repeating: .init(), count: 5)
//    }
//}
//
//struct AC: Repository {
//    typealias T = WebArticle1
//    func get(searchTerm: String, limit: Int)  -> IdentifiedArrayOf<T>  {
//        .init(repeating: .init(), count: 5)
//    }
//}
//
//
//struct Repo<A: Repository> {
//
//    let a: A
//    
//    init (_ a: A) {
//        self.a = a
//    }
//    
//    func get(searchTerm: String, limit: Int)  ->  IdentifiedArrayOf<A.T>  {
//        return  a.get(searchTerm: searchTerm, limit: limit)
//    }
//    
//}
//
// let bc = Repo((BC())).get(searchTerm: "", limit: 10)
