//
//  TVShowRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 19/10/23.
//

import Foundation

struct TVShowConstant {
    static let host: String = "api.themoviedb.org"
    static let schema: String = "https"
    static let commanPath: String = "3/tv/"
    static let version: String = "3"
}

enum TVShowAPIEndPoints: ApiEndPoints {
    case populer(page: Int = 1)
    case topRated(page: Int = 1)
    case tVShowDetails(id: Int)
    case genreList
    
    var host: String {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return TVShowConstant.host
        }
    }
    
    var schema: String {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return TVShowConstant.schema
        }
    }
    
    var path: String {
        switch self {
        case .populer:
            return "/\(Constants.version)/tv/popular"
        case .topRated:
            return "/\(Constants.version)/tv/top_rated"
        case .tVShowDetails(let id):
            return "/\(Constants.version)/tv/\(id)"
        case .genreList:
            return "/\(Constants.version)/genre/tv/list"
        }
    }
    
    var methode: String {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .populer(let page), .topRated(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .genreList:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .tVShowDetails:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey),
                    URLQueryItem(name: "append_to_response", value: "videos,credits")]
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return [("Content-Type", "application-json")]
        }
    }
    
    var statusCode: Int {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .populer, .topRated, .tVShowDetails, .genreList:
            return nil
        }
    }
    
}
