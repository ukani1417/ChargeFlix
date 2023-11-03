//
//  CastDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

protocol CastDetailRouterProtocol {
    var viewController: UINavigationController? { get set }
    
}

class CastDetailRouter: CastDetailRouterProtocol {
    var viewController: UINavigationController?
    
    init(viewController: UINavigationController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(type: CastType, cast: Person) -> UINavigationController {
        let viewController = CastDetailViewController()
        let navController = UINavigationController(rootViewController: viewController)
        
        let router: CastDetailRouterProtocol = CastDetailRouter(viewController: navController)
        let interactor: CastDetailInteractorProtocol = CastDetailInteractor()
        let presenter: CastDetailPresenterProtocol = CastDetailPresenter(view: viewController, 
                                                                         router: router,
                                                                         interactor: interactor,
                                                                         castType: type,
                                                                         cast: cast)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor = interactor
        viewController.presenter?.router = router
        viewController.presenter?.router?.viewController = navController
        viewController.presenter?.interactor?.presenter = presenter
        
        return navController
    }
}
