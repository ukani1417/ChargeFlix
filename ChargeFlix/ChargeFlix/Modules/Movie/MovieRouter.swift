//
//  MovieRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol MovieRouterProtocol: AnyObject {
    var viewController: UINavigationController? { get set }
    
    func navigateToMovieDetail(with movie: DetailModel)
}

class MovieRouter: MovieRouterProtocol {
   
    var viewController: UINavigationController?
    
    init(viewController: UINavigationController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = MovieViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Movies"
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router: MovieRouterProtocol = MovieRouter(viewController: navigationController)
        let interactor: MovieInteractorProtocol = MovieInteractor()
        
        let presenter: MoviePresenterProtocol = MoviePresenter(view: viewController, 
                                                                router: router,
                                                                interactor: interactor)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
    
        return navigationController
    }
    
    func navigateToMovieDetail(with movie: DetailModel) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController
            else {
                return
            }
            let movieDetailViewController = DetailRouter.createModule(movie: movie, contentType: .movieDetail)
            
            viewController.navigationBar.tintColor = .white
            viewController.navigationBar.prefersLargeTitles = false
            movieDetailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "arrow.left"),
                style: .done,
                target: self,
                action: #selector(self.backButtontapped(_:))
            )
            
            movieDetailViewController.title = movie.originalTitle
            viewController.tabBarController?.tabBar.isHidden = true
            viewController.pushViewController(movieDetailViewController, animated: true)
                        
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationBar.prefersLargeTitles = true
            self?.viewController?.tabBarController?.tabBar.isHidden = false
            self?.viewController?.popViewController(animated: true)
        }
    }
    
}
