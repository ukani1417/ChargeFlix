//
//  HomeEntity.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

struct TableHeaderInput {
    let title: String
    let poster: String
    let votes: String
    let starts: [String]
    let genreList: [Genre]
}

struct CommonListModel: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let results: [ContentObject]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ContentObject: Codable {
    let id: Int?
    let posterPath: String?
    let originalName: String?
    let originalTitle: String?
    let genres: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case genres = "genre_ids"
    }
}

enum DataType: Equatable {
    case popularMovies
    case topRatedMovies
    case upcomingMovies
    case nowPlayingMovies
    case popularTVShows
    case topRatedTVShows
    case castDetail
    case castMovieCredit
    case castTVShowCredit
    case movieDetail
    case tvShowDetail
    case movieGenreList
    case tvShowGenreList
}

extension DataType {
    func toEndPoint(_ resource: Int) -> ApiEndPoints {
        switch self {
        case .popularMovies:
            return MovieAPIEndPoints.populer(page: resource)
        case .topRatedMovies:
            return MovieAPIEndPoints.topRated(page: resource)
        case .upcomingMovies:
            return MovieAPIEndPoints.upComing(page: resource)
        case .nowPlayingMovies:
            return MovieAPIEndPoints.nowPlaying(page: resource)
        case .movieGenreList:
            return MovieAPIEndPoints.genreList
        case .movieDetail:
            return MovieAPIEndPoints.movieDetails(id: resource)
            
        case .popularTVShows:
            return TVShowAPIEndPoints.populer(page: resource)
        case .topRatedTVShows:
            return TVShowAPIEndPoints.topRated(page: resource)
        case .tvShowDetail:
            return TVShowAPIEndPoints.tVShowDetails(id: resource)
        case .tvShowGenreList:
            return TVShowAPIEndPoints.genreList
        
        case .castDetail:
            return CastAPIEnpoints.personDetails(id: resource)
        case .castMovieCredit, .castTVShowCredit:
            return CastAPIEnpoints.knownTVShows(id: resource)
        }
    }
}

enum HomePresenterError: String, Error {
    case serverError = "server Error, try again after some time"
    case failedToFetchMoviesList = "failed to fetch movies list"
    case failedToFetchMovieDetail = "failed to fetch movie detail"
    case failedToFetchGenreList = "failed to fetch genreList"
}

enum ForUse {
    case setupHeader
    case pushToDetail
}
