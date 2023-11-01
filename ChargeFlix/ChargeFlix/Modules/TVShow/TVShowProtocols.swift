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
    
    func onFetchPopularTVShowsListSuccess(list: [ListObj])
    func onFetchPopularTVShowsListFailure()
}

protocol TVShowPresenterInterface: AnyObject {
    var view: TVShowViewInterface? { get set }
    var router: TVShowRouterInterface? { get set }
    var interactor: TVShowInteractorInterface? { get set }
    
    func viewDidLoad()
    func onfetchSuccess(tvShowType: TVShowType, data: [ListObj])
    func onFetchPopularTVShowsListFailure()
}

protocol TVShowInteractorInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
    var repository: TVShowRepository? { get set }
    var popularTVShowsList: PopularTVShowsList? { get set }
    
    func getTVShow(type: TVShowType)
}

protocol TVShowRouterInterface: AnyObject {
    
}
