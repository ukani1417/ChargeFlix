//
//  MovieDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    var repository: CommonRepository? { get set }

    func getCastDetail(id: Int) 
}

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    var repository: CommonRepository?
    
    init(presenter: DetailPresenter? = nil,
         repository: CommonRepository = CommonRepository()) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func getCastDetail(id: Int) {
        repository?.get(endPoint: DataType.castDetail.fromDataTypeToEndPoint(id),
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
