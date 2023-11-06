//
//  CastDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import Foundation

protocol CastDetailInteractorProtocol {
    var presenter : CastDetailPresenterProtocol? { get set }
    var repository: CommonRepository { get set }
}

class CastDetailInteractor: CastDetailInteractorProtocol {
    weak var presenter: CastDetailPresenterProtocol?
    var repository: CommonRepository
    
    init(repository: CommonRepository = CommonRepository()) {
        self.repository = repository
    }
    
}
