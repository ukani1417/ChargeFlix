//
//  DetailMockInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

class DetailMockInteractor: DetailInteractorProtocol {
    var presenter: ChargeFlix.DetailPresenterProtocol?
    var repository: ChargeFlix.Repository
    var data: Codable?
    var error: CommonRepositoryError?
    
    init(presenter: ChargeFlix.DetailPresenterProtocol? = nil, 
         repository: ChargeFlix.Repository,
         data: Codable? = nil,
         error: CommonRepositoryError? = nil) {
        self.presenter = presenter
        self.repository = repository
        self.data = data
        self.error = error
    }
    
    func getCastDetail(type: DataType, id: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(id), 
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
