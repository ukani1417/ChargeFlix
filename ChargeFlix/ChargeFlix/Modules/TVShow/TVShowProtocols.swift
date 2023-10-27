//
//  TVShowProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol TVShowViewInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
    
    func showActivity()
    func hideActivity()
    
    func onFetchPopularTVShowsListSuccess()
    func onFetchPopularTVShowsListFailure()
}

protocol TVShowPresenterInterface: AnyObject {
    var view: TVShowViewInterface? { get set }
    var router: TVShowRouterInterface? { get set }
    var interactor: TVShowInteractorInterface? { get set }
    
    func viewDidLoad()
    
    func onFetchPopularTVShowsListSuccess()
    func onFetchPopularTVShowsListFailure()
    
    func numbersOfItemInSection(section: Int) -> Int
    func setupCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func didSelect(indexPath: IndexPath)
}

protocol TVShowInteractorInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
    var repository: TVShowRepository? { get set }
    var popularTVShowsList: PopularTVShowsList? { get set }
    
    func getPopulerTVShows()
}

protocol TVShowRouterInterface: AnyObject {
    
}
