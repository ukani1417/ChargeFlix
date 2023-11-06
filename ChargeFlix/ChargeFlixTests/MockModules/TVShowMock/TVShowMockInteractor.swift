//
//  TVShowMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class TVShowMockInteractor: TVShowInteractorProtocol {
    var presenter: ChargeFlix.TVShowPresenterProtocol?
    var repository: ChargeFlix.Repository
    var data: Codable?
    var error: CommonRepositoryError?
    
    init(presenter: ChargeFlix.TVShowPresenterProtocol? = nil, repository: ChargeFlix.Repository, data: Codable? = nil, error: CommonRepositoryError? = nil) {
        self.presenter = presenter
        self.repository = repository
        self.data = data
        self.error = error
    }
    
    func getTVShows(type: ChargeFlix.DataType, page: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(page), modelType: CommonListModel.self) { result in
            switch result {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    func getTVShowById(type: DataType, id: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(id), modelType: DetailModel.self) { result in
            switch result {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    
}
