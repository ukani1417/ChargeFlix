//
//  CastAPIRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 19/10/23.
//

import Foundation

struct CastConstant {
    static let host: String = "api.themoviedb.org"
    static let schema: String = "https"
    static let version: String = "3"
}

enum CastAPIEnpoints: ApiEndPoints {
    
    case tVShowsCast(id: Int)
    case movieCast(id: Int)
    case personDetails(id: Int)
    case personImages(id: Int)
    case knownMovies(id: Int)
    case knownTVShows(id: Int)
    
    var host: String {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return CastConstant.host
        }
    }
    
    var schema: String {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return CastConstant.schema
        }
    }
    
    var path: String {
        switch self {
        case .tVShowsCast(let id):
            return "/\(Constants.version)/tv/\(id)/credits"
        case .movieCast(let id):
            return  "/\(Constants.version)/movie/\(id)/credits"
        case .personDetails(let id):
            return "/\(Constants.version)/person/\(id)"
        case .knownMovies(let id):
            return  "/\(Constants.version)/person/\(id)/movie_credits"
        case .knownTVShows(let id):
            return "/\(Constants.version)/person/\(id)/tv_credits"
        case .personImages(let id):
            return "/\(Constants.version)/person/\(id)/images"
        }
    }
    
    var methode: String {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .tVShowsCast, .movieCast, .personDetails, .knownMovies, .knownTVShows, .personImages:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return [("Content-Type", "application-json")]
        }
    }
    
    var statusCode: Int {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .knownTVShows, .knownMovies, .movieCast, .tVShowsCast, .personDetails, .personImages:
            return nil
        }
    }
}
