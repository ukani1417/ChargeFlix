//
//  HomeRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterInterface {
    
    var viewController: UINavigationController? 
    var delegate: HomeToMovieProtocol?
    
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router: HomeRouterInterface = HomeRouter()
        let interactor: HomeInteractorInterface = HomeInteractor()
        let presenter: HomePresenterInterface = HomePresenter(view: viewController, 
                                                              router: router,
                                                              interactor: interactor)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.router?.viewController = navigationController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
    
        return navigationController
    }
    
    func switchToMovieModule(data: [ListObj]) {
        print("comes in router")
        delegate?.setupMovieModule(title: "Movies", data: data)
    }
}
