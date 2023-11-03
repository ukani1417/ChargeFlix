//
//  MovieDetailEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

struct MovieVideo: Codable {
    let id: Int?
    let results: [MovieVideoRecord]?
    
    func getKeys() -> [String] {
        return self.results?.compactMap({ $0.movieVideoKey }) ?? []
    }
}

struct MovieVideoRecord: Codable {
    let name, movieVideoKey: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt, id: String?
    
    enum CodingKeys: String, CodingKey {
        case name, site, size, type, official
        case publishedAt = "published_at"
        case id
        case movieVideoKey = "key"
    }
}
