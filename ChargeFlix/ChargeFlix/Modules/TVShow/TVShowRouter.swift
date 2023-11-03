//
//  TVShowRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol TVShowRouterInterface: AnyObject {
    var viewController: UINavigationController? { get set }
    func pushToTVShowDetail(with tvShow: TVShow)
}

class TVShowRouter: TVShowRouterInterface {
    
    var viewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let viewController = TVShowViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "TV Shows"
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router: TVShowRouterInterface = TVShowRouter()
        let interactor: TVShowInteractorInterface = TVShowInteractor()
        
        let presenter: TVShowPresenterInterface = TVShowPresenter(router: router, 
                                                                  interactor: interactor,
                                                                  view: viewController)
        router.viewController = navigationController
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToTVShowDetail(with tvShow: TVShow) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController
            else {
                return
            }
            let tvShowDetailViewController = TVShowDetailRouter.createModule(tvShow: tvShow)
            viewController.pushViewController(tvShowDetailViewController, animated: true)
        }
    }
}
