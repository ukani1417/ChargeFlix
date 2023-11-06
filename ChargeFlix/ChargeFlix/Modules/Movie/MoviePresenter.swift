//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol MoviePresenterProtocol: AnyObject {
    var view: MovieViewProtocol? { get set }
    var router: MovieRouterProtocol? { get set }
    var interactor: MovieInteractorProtocol? { get set }
    
    func viewDidLoad()
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, MoviePresenterError>)
    func onFetchMovieDetail(responce: Result<DetailModel, MoviePresenterError>)
    func configerMovies(type: String, data: [ContentObject])
}

class MoviePresenter: MoviePresenterProtocol {
    weak var view: MovieViewProtocol?
    var router: MovieRouterProtocol?
    var interactor: MovieInteractorProtocol?
    
    private var populerMovieList: [ContentObject] = []
    
    init(view: MovieViewProtocol? = nil, 
         router: MovieRouterProtocol? = nil,
         interactor: MovieInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showActity()
        interactor?.getMovies(type: .popularMovies, page: 1)
    }
    
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, MoviePresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            populerMovieList = data.results
            configerMovies(type: "Movies", data: data.results)
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchMovieDetail(responce: Result<DetailModel, MoviePresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            router?.navigateToMovieDetail(with: data)
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func configerMovies(type: String, data: [ContentObject]) {
        view?.setupTitle(title: type)
        view?.onFetchSuccess(data: data)
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
