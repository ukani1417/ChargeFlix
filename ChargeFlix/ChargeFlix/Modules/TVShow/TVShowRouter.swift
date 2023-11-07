//
//  TVShowRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

typealias TVShowPresenterType = TVShowViewToPresenterProtocol & TVShowInteractorToPresenterProtocol

class TVShowRouter: TVShowPresenterToRouterProtocol {

    var viewController: UINavigationController?
    var detailViewController: UIViewController?
    
    init(viewController: UINavigationController? = nil, detailViewController: UIViewController? = nil) {
        self.viewController = viewController
        self.detailViewController = detailViewController
    }
    
    static func createModule() -> UINavigationController {
        let viewController = TVShowViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "TV Shows"
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router: TVShowPresenterToRouterProtocol = TVShowRouter(viewController: navigationController)
        let interactor: TVShowPresenterToInteractorProtocol = TVShowInteractor()
        let presenter: TVShowPresenterType = TVShowPresenter(router: router,
                                                                  interactor: interactor,
                                                                  view: viewController)
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToTVShowDetail(with tvShow: DetailModel) {
        DispatchQueue.main.async { [weak self] in
            guard let viewController = self?.viewController else { return }
            
            guard let detailViewController = self?.detailViewController else {
                let detailViewController = DetailRouter.createModule(content: tvShow, contentType: .tvShowDetail)
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
            detailView?.presenter?.configContent(type: .tvShowDetail, content: tvShow)
            viewController.pushViewController(detailViewController, animated: true)
        
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.popViewController(animated: true)
       }
    }
}
