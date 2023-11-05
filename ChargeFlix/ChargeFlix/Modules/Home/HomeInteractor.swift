//
//  HomeInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    var repository: CommonRepository? { get set }
    
    func getMovies(type: DataType, page: Int)
    func getMovie(forUse: ForUse, type: DataType, id: Int)
    func getGenreList()
}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
    var repository: CommonRepository?
    
    init(repository: CommonRepository? = CommonRepository()) {
        self.repository = repository
    }
 
    func getMovies(type: DataType, page: Int = 1) {
        repository?.get(endPoint: type.fromDataTypeToEndPoint(page), modelType: CommonListModel.self) { responce in
            switch responce {
            case .success(let data):
                self.presenter?.onFetchMovies(dataType: type, responce: .success(data))
            case .failure:
                self.presenter?.onFetchMovies(dataType: type, responce: .failure(.failedToFetchMoviesList))
            }
        }
    }
    
    func getMovie(forUse: ForUse, type: DataType, id: Int) {
        repository?.get(endPoint: MovieAPIEndPoints.movieDetails(id: id), modelType: DetailModel.self) { responce in
            switch responce {
            case .success(let data):
                self.presenter?.onFetchMovie(forUse: forUse,
                                             responce: .success(data))
            case .failure:
                self.presenter?.onFetchMovie(forUse: forUse,
                                             responce: .failure(.failedToFetchMovieDetail))
            }
        }
        
    }
    
    func getGenreList() {
        repository?.get(endPoint: MovieAPIEndPoints.genreList, modelType: GenreList.self) { responce in
            switch responce {
            case .success(let data):
                self.presenter?.onFetchGenre(responce: .success(data))
            case .failure:
                self.presenter?.onFetchGenre(responce: .failure(.failedToFetchGenreList))
            }
        }
    }
    
}
