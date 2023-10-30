//
//  TVShowPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

class TVShowPresenter: TVShowPresenterInterface {
    var router: TVShowRouterInterface?
    var interactor: TVShowInteractorInterface?
    var view: TVShowViewInterface?
    
    private var popularTVShowsList: PopularTVShowsList? 
    
    init(router: TVShowRouterInterface? = nil, interactor: TVShowInteractorInterface? = nil, view: TVShowViewInterface? = nil) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.getPopulerTVShows()
    }
    
    func onFetchPopularTVShowsListSuccess() {
        popularTVShowsList = interactor?.popularTVShowsList
        view?.hideActivity()
        view?.onFetchPopularTVShowsListSuccess(list: popularTVShowsList)
    }
    
    func onFetchPopularTVShowsListFailure() {
        view?.hideActivity()
        view?.onFetchPopularTVShowsListFailure()
    }
    
    func numbersOfItemInSection(section: Int) -> Int {
        return popularTVShowsList?.list?.count ?? 0
    }
    
    func setupCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = popularTVShowsList?.list?[indexPath.row].originalName ?? "TVShowName"
        let poster = popularTVShowsList?.list?[indexPath.row].posterPath ?? ""
        cell.configCellContent(title: title, posterPath: poster )
        return cell
    }
    
    func didSelect(indexPath: IndexPath) {
        print("tapped index : \(indexPath.row)")
    }
}
