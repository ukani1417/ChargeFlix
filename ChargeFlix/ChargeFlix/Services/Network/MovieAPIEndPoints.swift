//
//  MovieAPIEndPoints.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum MovieAPIEndPoints: ApiEndPoints {
    case populer(page: Int = 1)
    case topRated(page: Int = 1)
    case upComing(page: Int = 1)
    case nowPlaying(page: Int = 1)
    case movieDetails(id: Int)
    case genreList
    
    var host: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList:
            return Constants.host
        }
    }
    
    var schema: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList:
            return "https"
        }
    }
    
    var path: String {
        switch self {
        case .populer:
            return "/\(Constants.version)/movie/popular"
        case .topRated:
            return "/\(Constants.version)/movie/top_rated"
        case .upComing:
            return "/\(Constants.version)/movie/upcoming"
        case .nowPlaying:
            return "/\(Constants.version)/movie/now_playing"
        case .movieDetails(let id):
            return "/\(Constants.version)/movie/\(id)"
        case .genreList:
            return "/\(Constants.version)/genre/movie/list"
        }
    }
    
    var methode: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .populer(let page), .nowPlaying(let page), .topRated(let page), .upComing(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .genreList:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .movieDetails:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey),
                    URLQueryItem(name: "append_to_response", value: "videos,credits")]
            
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .populer, .nowPlaying, .topRated, .upComing, .movieDetails, .genreList:
            return [("Content-Type", "application-json")]
        }
    }
    
    var statusCode: Int {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList:
            return nil
        }
    }
    
}

extension MovieAPIEndPoints {
    func toDataType() -> DataType {
        switch self {
        case .populer: return .popularMovies
        case .topRated: return .topRatedMovies
        case .upComing: return .upcomingMovies
        case .nowPlaying: return .nowPlayingMovies
        case .movieDetails: return .movieDetail
        case .genreList: return .movieGenreList
        }
    }
}
