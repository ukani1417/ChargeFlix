//
//  CastDetailEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import Foundation

struct Person: Codable {
    let id: Int?
    let biography: String?
    let name: String?
    let knownForDepartement: String?
    let profilePath: String?
    let images: Profile?
    let tvCredit: Credit?
    let movieCredit: Credit?
    
    enum CodingKeys: String, CodingKey {
        case id, biography, name, images
        case knownForDepartement = "known_for_department"
        case profilePath = "profile_path"
        case tvCredit = "tv_credits"
        case movieCredit = "movie_credits"
    }
    
}

struct Profile: Codable {
    let profiles: [Image]
}

struct Credit: Codable {
    let id: Int?
    let cast: [ContentObject]?
}

struct CastCredit: Codable {
    let cast: [Person]?
}

struct Cast: Codable {
    let id: Int?
    let cast: [Person]?
}

struct PersonImages: Codable {
    let id: Int?
    let profiles: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id, profiles
    }
}

struct Image: Codable {
    let filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}

enum CastPresenterError: String, Error {
    case failedOnCastCreditDetailContent = "Failed to fetch detail content"
}
