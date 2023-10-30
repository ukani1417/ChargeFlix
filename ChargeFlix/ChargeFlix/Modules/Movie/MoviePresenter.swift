//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

class MoviePresenter: MoviePresenterInterface {
   
    weak var view: MovieViewInterface?
    
    var router: MovieRouterInterface?
    
    var interactor: MovieInteractorInterface?
    
    private var populerMovieList: PopularMoviesList?
    
    init(view: MovieViewInterface? = nil, router: MovieRouterInterface? = nil, interactor: MovieInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showActity()
        interactor?.getPopularMovies()
    }
    
    func onFetchPopularMovieListSuccess() {
        populerMovieList = interactor?.popularMovieList
        view?.hideActivity()
        view?.onFetchPopularMovieListSuccess(data: populerMovieList?.ToListObj() ?? [])
    }
    
    func onFetchPopularMovieListFailure() {
        view?.hideActivity()
        view?.onFetchPopularMovieListFailure()
    }
    
    func numbersOfItemInSection(section: Int) -> Int {
        return populerMovieList?.list?.count ?? 0
    }
    
    func setupCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = populerMovieList?.list?[indexPath.row].originalTitle ?? "MovieName"
        let poster = populerMovieList?.list?[indexPath.row].posterPath ?? ""
        cell.configCellContent(title: title, posterPath: poster )
        return cell
    }
    
    func didSelect(indexPath: IndexPath) {
        print("tapped index : \(indexPath.row)")
    }
}
