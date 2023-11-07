//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class MoviePresenter: MovieViewToPresenterProtocol {
    weak var view: MoviePresenterToViewProtocol?
    var router: MoviePresenterToRouterProtocol?
    var interactor: MoviePresenterToInteractorProtocol?
    
    private(set) var populerMovieList: [ContentObject] = []
    private(set) var error: MoviePresenterError?
    private(set) var movieDetail: DetailModel?
    
    init(view: MoviePresenterToViewProtocol? = nil,
         router: MoviePresenterToRouterProtocol? = nil,
         interactor: MoviePresenterToInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showActity()
        interactor?.getMovies(type: .popularMovies, page: 1)
    }

    func configerMovies(type: String, data: [ContentObject]) {
        view?.setupTitle(title: type)
        view?.onFetchSuccess(data: data)
    }
    
}

extension MoviePresenter: MovieInteractorToPresenterProtocol {
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, MoviePresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            self.populerMovieList = data.results
            configerMovies(type: "Movies", data: data.results)
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchMovieDetail(responce: Result<DetailModel, MoviePresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            self.movieDetail = data
            router?.navigateToMovieDetail(with: data)
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
    }
}

// for didselect from CustomCollectionView
extension MoviePresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        if id != -1 {
            view?.showActity()
            interactor?.getMovieDetail(type: .movieDetail, id: id)
        }
    }
}
