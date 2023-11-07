//
//  MovieMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class MovieMockInteractor: MoviePresenterToInteractorProtocol {
    var presenter: ChargeFlix.MovieInteractorToPresenterProtocol?
    var repository: ChargeFlix.Repository
    
    var data: Codable?
    var error: CommonRepositoryError?
    
    init(presenter: ChargeFlix.MovieInteractorToPresenterProtocol? = nil, repository: ChargeFlix.Repository, data: Codable? = nil, error: CommonRepositoryError? = nil) {
        self.presenter = presenter
        self.repository = repository
        self.data = data
        self.error = error
    }
    func getMovies(type: ChargeFlix.DataType, page: Int) {
        repository.get(endPoint: type.toEndPoint(page),
                       modelType: CommonListModel.self) { result in
            switch result {
            case .success(let data): self.data = data
            case .failure(let error): self.error = error
            }
        }
    }
    
    func getMovieDetail(type: ChargeFlix.DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id),
                       modelType: DetailModel.self) { result in
            switch result {
            case .success(let data): self.data = data
            case .failure(let error): self.error = error
            }
        }
    }
    
    
}
