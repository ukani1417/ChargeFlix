//
//  TVShowDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol TVShowDetailInteractorProtocol {
    var presenter: TVShowDetailPresenterProtocol? { get set }
    var tvShowRepo: TVShowRepository? { get set }
    var castRepo: CastRepository? { get set }
    
    func getTVShowVideosById(id: Int)
    func getTVShowCastsById(id: Int)
    func getCastDetail(id: Int) 
}

class TVShowDetailInteractor: TVShowDetailInteractorProtocol {
    var tvShowRepo: TVShowRepository?
    
    var castRepo: CastRepository?
    
    weak var presenter: TVShowDetailPresenterProtocol?
    
    init(tvShowRepo: TVShowRepository? = TVShowRepository(), castRepo: CastRepository? = CastRepository()) {
        self.tvShowRepo = tvShowRepo
        self.castRepo = castRepo
    }
    
    func getTVShowVideosById(id: Int) {
        tvShowRepo?.getVideos(id: id, completation: { result in
            switch result {
            case.success(let data):
                self.presenter?.onFetchTVShowVideoSuccess(data: data)
            case .failure:
                self.presenter?.onFetchTVShowVideoFailure()
            }
        })
    }
    
    func getTVShowCastsById(id: Int) {
        castRepo?.getDetails(modelType: TVShowCast.self, id: id ) { result in
            switch result {
            case.success(let data):
                self.presenter?.onFetchTVShowCastSuccess(data: data)
            case .failure:
                self.presenter?.onFetchTVShowCastFailure()
            }
            }
                            
    }
    
    func getCastDetail(id: Int) {
        castRepo?.getDetails(modelType: Person.self, id: id, completation: { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastDetailSuccess(data: data)
            case .failure:
                self.presenter?.onFetchCastDetailFailure()
                
            }
        })
    }
}
