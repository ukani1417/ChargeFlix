//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class MoviePresenter: MoviePresenterInterface {
    weak var view: MovieViewInterface?
    
    var router: MovieRouterInterface?
    
    var interactor: MovieInteractorInterface?
    
    init(view: MovieViewInterface? = nil, router: MovieRouterInterface? = nil, interactor: MovieInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}
