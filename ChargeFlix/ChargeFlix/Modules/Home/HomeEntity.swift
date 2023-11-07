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
