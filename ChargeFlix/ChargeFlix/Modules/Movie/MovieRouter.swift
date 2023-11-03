//
//  MovieRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol MovieRouterInterface: AnyObject {
    var viewController: UINavigationController? { get set }
    
    func pushToMovieDetail(with movie: Movie)
}

class MovieRouter: MovieRouterInterface {
   
    var viewController: UINavigationController?
    
    init(viewController: UINavigationController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = MovieViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Movies"
        navigationController.navigationBar.prefersLargeTitles = true
        let router: MovieRouterInterface = MovieRouter(viewController: navigationController)
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
    
    func pushToMovieDetail(with movie: Movie) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController
            else {
                return
            }
             let movieDetailViewController = MovieDetailRouter.createModule(movie: movie)
            
            viewController.pushViewController(movieDetailViewController, animated: true)
        }
    }
    
}
