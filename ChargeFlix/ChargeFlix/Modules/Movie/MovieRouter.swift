//
//  MovieRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

typealias MoviePresenterType = MovieViewToPresenterProtocol & MovieInteractorToPresenterProtocol

class MovieRouter: MoviePresenterToRouterProtocol {
   
    var viewController: UINavigationController?
    var detailViewController: UIViewController?
    
    init(viewController: UINavigationController? = nil, detailViewController: UIViewController? = nil) {
        self.viewController = viewController
        self.detailViewController = detailViewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = MovieViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Movies"
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router: MoviePresenterToRouterProtocol = MovieRouter(viewController: navigationController)
        let interactor: MoviePresenterToInteractorProtocol = MovieInteractor()
        
        let presenter: MoviePresenterType = MoviePresenter(view: viewController, 
                                                                router: router,
                                                                interactor: interactor)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
    
        return navigationController
    }
    
    func navigateToMovieDetail(with movie: DetailModel) {
        DispatchQueue.main.async { [weak self] in
            guard let viewController = self?.viewController else { return }
            
            guard let detailViewController = self?.detailViewController else {
                let detailViewController = DetailRouter.createModule(content: movie, contentType: .movieDetail)
                self?.detailViewController = detailViewController
                detailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "arrow.left"),
                    style: .done,
                    target: self,
                    action: #selector(self?.backButtontapped(_:))
                )
                viewController.pushViewController(detailViewController, animated: true)
                return
            }
            
            let detailView = detailViewController as? DetailPresenterToViewProtocol
            detailView?.presenter?.configContent(type: .movieDetail, content: movie)
            viewController.pushViewController(detailViewController, animated: true)
        
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.popViewController(animated: true)
        }
    }
    
}
