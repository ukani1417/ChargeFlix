//
//  CastDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import Foundation

class CastDetailInteractor: CastDetailPresenterToInteractorProtocol {
 
    weak var presenter: CastDetailInteractorToPresenterProtocol?
    var repository: Repository
    
    init(repository: Repository = CommonRepository()) {
        self.repository = repository
    }
    
    func getCastCreditContentDetail(type: DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id), modelType: DetailModel.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastCreditContentDetail(type: type, responce: .success(data))
            case .failure:
                self.presenter?.onFetchCastCreditContentDetail(type: type, 
                                                               responce: .failure(.failedOnCastCreditDetailContent))
            }
        }
    }
    
}
