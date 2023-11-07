//
//  HomeRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

typealias HomePresenterType = HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol

class HomeRouter: HomePresenterToRouterProtocol {
    
    var viewController: UINavigationController?
    var movieViewController: UINavigationController?
    var detailViewController: UIViewController?
    
    init(viewController: UINavigationController? = nil, 
         movieViewController: UINavigationController? = nil,
         detailViewController: UIViewController? = nil) {
        self.viewController = viewController
        self.movieViewController = movieViewController
        self.detailViewController = detailViewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router: HomePresenterToRouterProtocol = HomeRouter(viewController: navigationController)
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let presenter: HomePresenterType = HomePresenter(view: viewController,
                                                         router: router,
                                                         interactor:  interactor)
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func navigateToMovieTab(type: String, data: [ContentObject]) {
        let movieViewController = self.viewController?.tabBarController?.viewControllers?[1]
        as? UINavigationController
        self.movieViewController = movieViewController
        let movieViewInterFace = movieViewController?.visibleViewController as? MovieViewProtocol
        movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
        viewController?.tabBarController?.selectedIndex = 1
    }
    
    func navigateToMovieDetail(with movie: DetailModel) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController else { return }
            
            guard let detailViewController = self.detailViewController else {
                let detailViewController = DetailRouter.createModule(content: movie, contentType: .movieDetail)
                self.detailViewController = detailViewController
                detailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "arrow.left"),
                    style: .done,
                    target: self,
                    action: #selector(self.backButtontapped(_:))
                )
                viewController.pushViewController(detailViewController, animated: true)
                return
            }
            
            let detailViewPresenter = detailViewController as? DetailPresenterToViewProtocol
            detailViewPresenter?.presenter?.configContent(type: .movieDetail, content: movie)
            
            viewController.pushViewController(detailViewController, animated: true)
            
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            
            self?.viewController?.popViewController(animated: true)
        }
    }
}
