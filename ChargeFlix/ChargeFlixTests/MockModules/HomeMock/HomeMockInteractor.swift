//
//  HomeMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class HomeMockInteractor: HomePresenterToInteractorProtocol {
    var presenter: ChargeFlix.HomeInteractorToPresenterProtocol?
    var repository: ChargeFlix.Repository
    
    var data: Codable?
    var error: CommonRepositoryError?

    init(repository: ChargeFlix.Repository = MockRepository()) {
        self.repository = repository
    }
    
    func getMovies(type: ChargeFlix.DataType, page: Int) {
        repository.get(endPoint: type.toEndPoint(page),
                       modelType: CommonListModel.self) { result in
            switch result {
            case .success(let data): 
                self.data = data
                self.presenter?.onFetchMovies(dataType: type, responce: .success(data))
                
            case .failure(let error): self.error = error
                self.presenter?.onFetchMovies(dataType: type, responce: .failure(.failedToFetchMoviesList))
            }
        }
    }
    
    func getMovie(forUse: ChargeFlix.ForUse, type: ChargeFlix.DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id),
                       modelType: DetailModel.self) { result in
            switch result {
            case .success(let data): 
                self.data = data
                self.presenter?.onFetchMovie(forUse: forUse, responce: .success(data))
            case .failure(let error):
                self.error = error
                self.presenter?.onFetchMovie(forUse: forUse, responce: .failure(.failedToFetchMovieDetail))
            }
        }
    }
    
    func getGenreList(type: DataType) {
        repository.get(endPoint: type.toEndPoint(0),
                       modelType: GenreList.self) { result in
            switch result {
            case .success(let data): 
                self.data = data
                self.presenter?.onFetchGenre(responce: .success(data))
            case .failure(let error): 
                self.error = error
                self.presenter?.onFetchGenre(responce: .failure(.failedToFetchGenreList))
            }
        }
    }
    
    
}
