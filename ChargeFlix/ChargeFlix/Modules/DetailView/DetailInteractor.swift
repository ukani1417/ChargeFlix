//
//  MovieDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

class DetailInteractor: DetailPresenterToInteractorProtocol {
    
    weak var presenter: DetailInteractorToPresenterProtocol?
    var repository: Repository
    
    init(repository: Repository = CommonRepository()) {
        self.repository = repository
    }
    
    func getCastDetail(type: DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id),
                        modelType: Person.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastDetail(responce: .success(data))
            case .failure:
                self.presenter?.onFetchCastDetail(responce: .failure(.failedInCastDetail))
            }
        }
    }
    
}
