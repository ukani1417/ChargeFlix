//
//  CastDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

typealias CastDetailPresenterType = CastDetailViewToPresenterProtocol & CastDetailInteractorToPresenterProtocol

class CastDetailRouter: CastDetailPresenterToRouterProtocol {
    
    var viewController: UIViewController?
    var detailViewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(type: DataType, cast: Person) -> UIViewController {
        let viewController = CastDetailViewController()
        let router: CastDetailPresenterToRouterProtocol = CastDetailRouter(viewController: viewController)
        let interactor: CastDetailPresenterToInteractorProtocol = CastDetailInteractor()
        let presenter: CastDetailPresenterType = CastDetailPresenter(view: viewController,
                                                                         router: router,
                                                                         interactor: interactor,
                                                                         castType: type,
                                                                         cast: cast)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
    func navigateToDetailView(content: DetailModel, type: DataType) {
        DispatchQueue.main.async { [weak self] in
            guard let viewController = self?.viewController else { return }
            
            guard let detailViewController = self?.detailViewController else {
                let detailViewController = DetailRouter.createModule(content: content, contentType: type)
                self?.detailViewController = detailViewController
                detailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "arrow.left"),
                    style: .done,
                    target: self,
                    action: #selector(self?.backButtontapped(_:))
                )
                viewController.navigationController?.pushViewController(detailViewController, animated: true)
                return
            }
            
            let detailView = detailViewController as? DetailPresenterToViewProtocol
            detailView?.presenter?.configContent(type: type, content: content)
            viewController.navigationController?.pushViewController(detailViewController, animated: true)
            
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popViewController(animated: true)
       }
    }
    
    
    
}
