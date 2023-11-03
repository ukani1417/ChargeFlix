//
//  CastDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import Foundation

protocol CastDetailInteractorProtocol {
    var presenter : CastDetailPresenterProtocol? { get set }
    var castRepo: CastRepository? { get set }

    func getCastImagesById(id: Int)
    func getCastCreditById(type: CastType,id: Int)
}

class CastDetailInteractor: CastDetailInteractorProtocol {
    weak var presenter: CastDetailPresenterProtocol?
    
    var castRepo: CastRepository?
    
    init(presenter: CastDetailPresenterProtocol? = nil, castRepo: CastRepository? = CastRepository()) {
        self.presenter = presenter
        self.castRepo = castRepo
    }
    
    func getCastImagesById(id: Int) {
     
        castRepo?.getDetails(modelType: PersonImages.self , id: id) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastImagesSuccess(data: data.toListObj())
            case .failure:
                self.presenter?.onFetchCastImagesFailure()
            }
        }
    }
    
    func getCastCreditById(type: CastType, id: Int) {
        if type == .movie {
            castRepo?.getDetails(modelType: KnownForMovie.self, id: id) { result in
                switch result {
                case .success(let data):
                    self.presenter?.onFetchCastCredit(data: data.toListObj())
                case .failure:
                    self.presenter?.onFetchCastCreditFailure()
                }
            }
        } else {
            castRepo?.getDetails(modelType: KnownForTVShow.self, id: id) { result in
                switch result {
                case .success(let data):
                    self.presenter?.onFetchCastCredit(data: data.toListObj())
                case .failure:
                    self.presenter?.onFetchCastCreditFailure()
                }
            }
        }
       
    }
}
