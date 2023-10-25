//
//  TVShowPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class TVShowPresenter: TVShowPresenterInterface {
    var router: TVShowRouterInterface?
    
    var interactor: TVShowInteractorInterface?
    
    var view: TVShowViewInterface?
    
    init(router: TVShowRouterInterface? = nil, interactor: TVShowInteractorInterface? = nil, view: TVShowViewInterface? = nil) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
}
