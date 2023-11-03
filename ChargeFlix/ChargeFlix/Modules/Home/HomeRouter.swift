//
//  HomeRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

protocol HomeRouterInterface {
    var viewController: UINavigationController? { get set }
    var movieViewController: UINavigationController? { get set }
    
    func switchToMovieModule(type: String, data: [ListObj])
    func pushToMovieDetail(with movie: Movie) 
}

class HomeRouter: HomeRouterInterface {
   
    var viewController: UINavigationController? 
    var movieViewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        var router: HomeRouterInterface = HomeRouter()
        let interactor: HomeInteractorInterface = HomeInteractor()
        let presenter: HomePresenterInterface = HomePresenter(view: viewController, 
                                                              router: router,
                                                              interactor: interactor)
        router.viewController = navigationController
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.router?.viewController = navigationController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
    
        return navigationController
    }
    
    func switchToMovieModule(type: String, data: [ListObj]) {
        
        guard let movieViewController = movieViewController else {
              DispatchQueue.main.async { [weak self] in
                let movieViewController = self?.viewController?.tabBarController?.viewControllers?[1] 
                                          as? UINavigationController
                self?.movieViewController = movieViewController
                let movieViewInterFace = movieViewController?.visibleViewController as? MovieViewInterface
                  movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
              }
              return
            }
        let movieViewInterFace = movieViewController.visibleViewController as? MovieViewInterface
        movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
        viewController?.tabBarController?.selectedIndex = 1
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
