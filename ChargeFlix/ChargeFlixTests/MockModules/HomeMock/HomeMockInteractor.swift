//
//  HomeMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class HomeMockInteractor: HomeInteractorProtocol {
    var presenter: ChargeFlix.HomePresenterProtocol?
    var repository: ChargeFlix.Repository
    
    var data: Codable?
    var error: CommonRepositoryError?

    init(repository: ChargeFlix.Repository = MockRepository()) {
        self.repository = repository
    }
    
    func getMovies(type: ChargeFlix.DataType, page: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(page),
                       modelType: CommonListModel.self) { result in
            switch result {
            case .success(let data): self.data = data
            case .failure(let error): self.error = error
            }
        }
    }
    
    func getMovie(forUse: ChargeFlix.ForUse, type: ChargeFlix.DataType, id: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(id),
                       modelType: DetailModel.self) { result in
            switch result {
            case .success(let data): self.data = data
            case .failure(let error): self.error = error
            }
        }
    }
    
    func getGenreList(type: DataType) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(0),
                       modelType: GenreList.self) { result in
            switch result {
            case .success(let data): self.data = data
            case .failure(let error): self.error = error
            }
        }
    }
    
    
}
