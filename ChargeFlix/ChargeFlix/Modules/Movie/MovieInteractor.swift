//
//  MovieInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol MovieInteractorProtocol: AnyObject {
    var presenter: MoviePresenterProtocol? { get set }
    var repository: CommonRepository? { get set }

    func getMovies(type: DataType, page: Int)
    func getMovieDetail(id: Int)
}

class MovieInteractor: MovieInteractorProtocol {
    
    var presenter: MoviePresenterProtocol?
    var repository: CommonRepository?
    
    init(repository: CommonRepository? = CommonRepository()) {
        self.repository = repository
    }
    
    func getMovies(type: DataType, page: Int = 1) {
        let endPoint = type.fromDataTypeToEndPoint(page)
        repository?.get(endPoint: endPoint, modelType: CommonListModel.self) { responce in
            switch responce {
            case .success(let data):
                self.presenter?.onFetchMovies(dataType: type, responce: .success(data))
            case .failure:
                self.presenter?.onFetchMovies(dataType: type, responce: .failure(.failedInPopularMovies))
            }
        }
    }
    
    func getMovieDetail(id: Int) {
        repository?.get(endPoint: DataType.movieDetail.fromDataTypeToEndPoint(id), 
                        modelType: DetailModel.self) { responce in
            switch responce {
            case .success(let data):
                self.presenter?.onFetchMovieDetail(responce: .success(data))
            case .failure:
                self.presenter?.onFetchMovieDetail(responce: .failure(.failedInMovieDetail))
            }
        }
        
    }

}
