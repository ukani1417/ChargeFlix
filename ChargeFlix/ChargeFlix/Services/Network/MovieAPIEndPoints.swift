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
    case movieVideo(id: Int)
    
    var host: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList, .movieVideo:
            return Constants.host
        }
    }
    
    var schema: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList, .movieVideo:
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
        case .movieVideo(let id):
            return "/\(Constants.version)/movie/\(id)/videos"
        }
    }
    
    var methode: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList, .movieVideo:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .populer(let page), .nowPlaying(let page), .topRated(let page), .upComing(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .movieDetails, .genreList, .movieVideo:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .populer, .nowPlaying, .topRated, .upComing, .movieDetails, .genreList, .movieVideo:
            return [("Content-Type", "application-json")]
        }
    }
    
    var statusCode: Int {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList, .movieVideo:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .genreList, .movieVideo:
            return nil
        }
    }
}
