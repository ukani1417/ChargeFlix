//
//  MovieDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

protocol MovieDetailRouterProtocol {
    var viewController: UIViewController? { get set }
    func pushToCastDetail(type: CastType, cast: Person)
}

class MovieDetailRouter: MovieDetailRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule(movie: Movie) -> UIViewController {
        let viewController = MovieDetailViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router: MovieDetailRouterProtocol = MovieDetailRouter()
        let interactor: MovieDetailInteractorProtocol = MovieDetailInteractor()
        let presenter: MovieDetailPresenterProtocol = MovieDetailPresenter(view: viewController,
                                                                           interactor: interactor,
                                                                           router: router,
                                                                           movie: movie)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.router?.viewController = viewController
        viewController.presenter?.interactor = interactor
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
                viewController.navigationController?.pushViewController(destinationVC, animated: true)
            } else {
                print("Destination view controller is nil.")
            }
        }
    }
}
