//
//  HomeEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

struct GenreList: Codable {
    let list: [Genre]
}

struct MovieData {
    let type: MovieType
    let data: [ListObj]
}

struct TableHeaderInput {
    let title: String
    let poster: String
    let votes: String
    let fullStar: Int
    let halfStar: Int
    let genreList: [Genre]
}

struct ListObj: Codable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let backdropPath: String?
    let genre: [Int]?
    let voteAverage: Double?
    let voteCount: Int?
}

