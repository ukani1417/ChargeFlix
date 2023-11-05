//
//  CastDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

protocol CastDetailRouterProtocol {
    var viewController: UIViewController? { get set }
}

class CastDetailRouter: CastDetailRouterProtocol {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(type: DataType, cast: Person) -> UIViewController {
        let viewController = CastDetailViewController()
        let router: CastDetailRouterProtocol = CastDetailRouter(viewController: viewController)
        let interactor: CastDetailInteractorProtocol = CastDetailInteractor()
        let presenter: CastDetailPresenterProtocol = CastDetailPresenter(view: viewController, 
                                                                         router: router,
                                                                         interactor: interactor,
                                                                         castType: type,
                                                                         cast: cast)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
}
