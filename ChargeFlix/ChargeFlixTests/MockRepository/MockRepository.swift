//
//  MockRepository.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class MockRepository: Repository {
    
   
    
    func get<T: Codable>(endPoint: ChargeFlix.ApiEndPoints,
                         modelType: T.Type,
                         completation: @escaping (Result<T, ChargeFlix.CommonRepositoryError>) -> Void)  {
        let dataType = endPoint.toDataType()
        switch dataType {
            
        case .popularMovies, .topRatedMovies, .upcomingMovies, .nowPlayingMovies:
            print("datatype: \(dataType), model : \(modelType)")
            guard let data = getMoviesListResponce() as? T else {
                print("failed to convert")
                return completation(.failure(.serverError))
            }
            print("worked")
            completation(.success(data))
        case .popularTVShows, .topRatedTVShows:
            guard let data = getTVShowListDataResponce() as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
        case .castDetail:
            guard let data = getCastDetailResponce() as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
        case .castMovieCredit, .castTVShowCredit:
            guard let data = getCastDetailResponce() as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
        case .movieDetail:
            guard let data = getMoviesDetailResponce() as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
        case .tvShowDetail:
            guard let data = getTVShowDataResponce() as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
            
        case .movieGenreList:
            guard let data = movieGenreResponse as? T else {
                return completation(.failure(.serverError))
            }
            completation(.success(data))
        default: do {
            completation(.failure(.serverError))
        }
        }
    }
    
}
