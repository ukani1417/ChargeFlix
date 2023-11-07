//
//  TVShowInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class TVShowInteractor: TVShowPresenterToInteractorProtocol {
    weak var presenter: TVShowInteractorToPresenterProtocol?
    var repository: Repository
    
    init(repository: Repository = CommonRepository()) {
        self.repository = repository
    }
    
    func getTVShows(type: DataType, page: Int) {
        repository.get(endPoint: type.toEndPoint(page),
                        modelType: CommonListModel.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchTVShows(type: type, responce: .success(data))
            case .failure:
                self.presenter?.onFetchTVShows(type: type, responce: .failure(.failedInTVShows))
            }
        }
    }
    
    func getTVShowById(type: DataType, id: Int) {
        repository.get(endPoint: type.toEndPoint(id),
                        modelType: DetailModel.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchTVShowDetail(responce: .success(data))
            case .failure:
                self.presenter?.onFetchTVShowDetail(responce: .failure(.failedInTVshowDetail))
            }
        }
    }
    
}
