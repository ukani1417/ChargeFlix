//
//  MovieRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class MovieRouter: MovieRouterInterface {
    static func createModule() -> UINavigationController {
        let viewController = MovieViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Movies"
        navigationController.navigationBar.prefersLargeTitles = true
        let router: MovieRouterInterface = MovieRouter()
        let interactor: MovieInteractorInterface = MovieInteractor()
        
        let presenter: MoviePresenterInterface = MoviePresenter(view: viewController, 
                                                                router: router,
                                                                interactor: interactor)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
}
