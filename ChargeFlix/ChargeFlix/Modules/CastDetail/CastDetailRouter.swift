//
//  CastDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

typealias CastDetailPresenterType = CastDetailViewToPresenterProtocol & CastDetailInteractorToPresenterProtocol
class CastDetailRouter: CastDetailPresenterToRouterProtocol {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(type: DataType, cast: Person) -> UIViewController {
        let viewController = CastDetailViewController()
        let router: CastDetailPresenterToRouterProtocol = CastDetailRouter(viewController: viewController)
        let interactor: CastDetailPresenterToInteractorProtocol = CastDetailInteractor()
        let presenter: CastDetailPresenterType = CastDetailPresenter(view: viewController,
                                                                         router: router,
                                                                         interactor: interactor,
                                                                         castType: type,
                                                                         cast: cast)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
}
