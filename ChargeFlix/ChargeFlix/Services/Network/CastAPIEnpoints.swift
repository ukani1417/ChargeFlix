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

    case personDetails(id: Int)
    case knownMovies(id: Int)
    case knownTVShows(id: Int)
    
    var host: String {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return CastConstant.host
        }
    }
    
    var schema: String {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return CastConstant.schema
        }
    }
    
    var path: String {
        switch self {
        case .personDetails(let id):
            return "/\(Constants.version)/person/\(id)"
        case .knownMovies(let id):
            return  "/\(Constants.version)/person/\(id)/movie_credits"
        case .knownTVShows(let id):
            return "/\(Constants.version)/person/\(id)/tv_credits"
    
        }
    }
    
    var methode: String {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .knownMovies, .knownTVShows:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .personDetails:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey),
                    URLQueryItem(name: "append_to_response",value: "images,movie_credits,tv_credits")]
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return [("Content-Type", "application-json")]
        }
    }
    
    var statusCode: Int {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .knownTVShows, .knownMovies, .personDetails:
            return nil
        }
    }
    
}

extension CastAPIEnpoints {
    func toDataType() -> DataType {
        switch self {
        case .personDetails:
            return .castDetail
        case .knownMovies:
            return .castMovieCredit
        case .knownTVShows:
            return .castTVShowCredit
        }
    }
}
