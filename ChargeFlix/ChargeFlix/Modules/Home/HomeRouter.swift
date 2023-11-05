//
//  HomeRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    var viewController: UINavigationController? { get set }
    var movieViewController: UINavigationController? { get set }
    
    func switchToMovieModule(type: String, data: [ContentObject])
    func pushToMovieDetail(with movie: DetailModel)
}

class HomeRouter: HomeRouterProtocol {
    
    var viewController: UINavigationController?
    var movieViewController: UINavigationController?
    
    init(viewController: UINavigationController? = nil, movieViewController: UINavigationController? = nil) {
        self.viewController = viewController
        self.movieViewController = movieViewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router: HomeRouterProtocol = HomeRouter(viewController: navigationController)
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let presenter: HomePresenterProtocol = HomePresenter(view: viewController,
                                                              router: router,
                                                              interactor: interactor)
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func switchToMovieModule(type: String, data: [ContentObject]) {
        
        let movieViewController = self.viewController?.tabBarController?.viewControllers?[1]
        as? UINavigationController
        self.movieViewController = movieViewController
        let movieViewInterFace = movieViewController?.visibleViewController as? MovieViewProtocol
        movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
        viewController?.tabBarController?.selectedIndex = 1
    }
    
    func pushToMovieDetail(with movie: DetailModel) {
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
