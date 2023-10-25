//
//  TVShowRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class TVShowRouter: TVShowRouterInterface {
    static func createModule() -> UINavigationController {
        let viewController = TVShowViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "TV Shows"
        navigationController.navigationBar.prefersLargeTitles = true
        let router: TVShowRouterInterface = TVShowRouter()
        let interactor: TVShowInteractorInterface = TVShowInteractor()
        
        let presenter: TVShowPresenterInterface = TVShowPresenter(router: router, interactor: interactor, view: viewController)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
}
