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
    
}
