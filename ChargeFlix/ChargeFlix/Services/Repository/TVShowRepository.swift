//
//  TVShowRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum TVShowRepositoryError: String, Error {
    case serverError = "Server error , try again after some time"
}

class TVShowRepository {
    
    func get(type: TVShowType,
             page: Int = 1,
             completation: @escaping (Result<TVShowList, TVShowRepositoryError>) -> Void ) {
        
        let endPoint: TVShowAPIEndPoints = {
            switch type {
            case .populer:  return TVShowAPIEndPoints.populer(page: page)
            case .topRated: return  TVShowAPIEndPoints.topRated(page: page)
            }
        }()
    
        APIManager.shared.request(apiRouter: endPoint, modelType: TVShowList.self) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
       
    func getDetails(id: Int, completation: @escaping (Result<TVShow, TVShowRepositoryError>) -> Void ) {
        APIManager.shared.request(apiRouter: TVShowAPIEndPoints.tVShowDetails(id: id),
                                  modelType: TVShow.self) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
    
    func getVideos(id: Int, completation: @escaping (Result<MovieVideo, TVShowRepositoryError>) -> Void) {
        
        APIManager.shared.request(
            apiRouter: TVShowAPIEndPoints.tvShowVideo(id: id),
            modelType: MovieVideo.self) { result in
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
