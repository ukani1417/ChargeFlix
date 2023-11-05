//
//  TVShowRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol TVShowRouterProtocol: AnyObject {
    var viewController: UINavigationController? { get set }
    func navigateToTVShowDetail(with tvShow: DetailModel)
}

class TVShowRouter: TVShowRouterProtocol {

    var viewController: UINavigationController?
    var tvShowDetailViewController: UIViewController?
    
    init(viewController: UINavigationController? = nil, tvShowDetailViewController: UIViewController? = nil) {
        self.viewController = viewController
        self.tvShowDetailViewController = tvShowDetailViewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = TVShowViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "TV Shows"
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router: TVShowRouterProtocol = TVShowRouter(viewController: navigationController)
        let interactor: TVShowInteractorProtocol = TVShowInteractor()
        let presenter: TVShowPresenterProtocol = TVShowPresenter(router: router, 
                                                                  interactor: interactor,
                                                                  view: viewController)
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToTVShowDetail(with tvShow: DetailModel) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController
            else {
                return
            }
            let tvShowDetailViewController = DetailRouter.createModule(movie: tvShow, contentType: .tvShowDetail)
            
            viewController.navigationBar.tintColor = .white
            viewController.navigationBar.prefersLargeTitles = false
            tvShowDetailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "arrow.left"),
                style: .done,
                target: self,
                action: #selector(self.backButtontapped(_:))
            )
            
            tvShowDetailViewController.title = tvShow.originalName
            viewController.tabBarController?.tabBar.isHidden = true
            viewController.pushViewController(tvShowDetailViewController, animated: true)
                        
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
