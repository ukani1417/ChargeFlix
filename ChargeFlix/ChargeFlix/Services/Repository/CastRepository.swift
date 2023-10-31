//
//  CastRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum CastRepositoryError: String, Error {
    case serverError = "Server error , try again after some time"
}

class CastRepository {
    func getDetails<T: Codable>(modelType: T.Type,
                                id: Int,
                                completation: @escaping (Result<T, CastRepositoryError>) -> Void) {
        
        var apiEndPoints: CastAPIEnpoints? {
            switch modelType {
            case is TVShowCast.Type: return .tVShowsCast(id: id)
            case is MovieCast.Type: return .movieCast(id: id)
            case is KnownForMovie.Type: return .knownMovies(id: id)
            case is KnownForTVShow.Type: return .knownTVShows(id: id)
            case is Person.Type: return .personDetails(id: id)
            case is PersonImages.Type: return .personImages(id: id)
            default: return nil
            }
        }
        
        guard let apiEnd = apiEndPoints else {
            return completation(.failure(.serverError))
        }
        
        APIManager.shared.request(apiRouter: apiEnd, modelType: modelType) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
}
