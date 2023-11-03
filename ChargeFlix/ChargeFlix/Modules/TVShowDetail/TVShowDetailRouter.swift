//
//  TVShowDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

protocol TVShowDetailRouterProtocol {
    var viewController: UIViewController? { get set }
    func pushToCastDetail(type: CastType, cast: Person)
}

class TVShowDetailRouter: TVShowDetailRouterProtocol {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(tvShow: TVShow) -> UIViewController {
        let viewController = TVShowDetailViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router: TVShowDetailRouterProtocol = TVShowDetailRouter()
        let interactor: TVShowDetailInteractorProtocol = TVShowDetailInteractor()
        let presenter: TVShowDetailPresenterProtocol = TVShowDetailPresenter(view: viewController,
                                                                             router: router, interactor: interactor,
                                                                             tvShow: tvShow)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.router?.viewController = viewController
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToCastDetail(type: CastType, cast: Person) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController else {
                print("ViewController is not set correctly.")
                return
            }
            
            let destinationVC = CastDetailRouter.createModule(type: type, cast: cast).visibleViewController
            if let destinationVC = destinationVC {
                print("Pushing to CastDetailViewController.")
                viewController.navigationController?.pushViewController(destinationVC, animated: true)
            } else {
                print("Destination view controller is nil.")
            }
        }
    }
}
