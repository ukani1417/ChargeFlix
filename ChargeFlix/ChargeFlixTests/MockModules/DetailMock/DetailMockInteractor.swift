//
//  DetailMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class DetailMockInteractor: DetailPresenterToInteractorProtocol {
    var presenter: ChargeFlix.DetailInteractorToPresenterProtocol?
    var repository: ChargeFlix.Repository
    var data: Codable?
    var error: CommonRepositoryError?
    
    init(presenter: ChargeFlix.DetailInteractorToPresenterProtocol? = nil, 
         repository: ChargeFlix.Repository,
         data: Codable? = nil,
         error: CommonRepositoryError? = nil) {
        self.presenter = presenter
        self.repository = repository
        self.data = data
        self.error = error
    }
    
    func getCastDetail(type: DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id), 
                       modelType: Person.self) { result in
            switch result {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    
}
