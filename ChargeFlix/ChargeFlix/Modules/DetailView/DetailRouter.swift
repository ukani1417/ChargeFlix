//
//  MovieDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

typealias DetailPresenterType = DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol

class DetailRouter: DetailPresenterToRouterProtocol {
    var viewController: UIViewController?
    var castDetailViewController: UIViewController?
    
    init(viewController: UIViewController? = nil, 
         castDetailViewController: UIViewController? = nil) {
        self.viewController = viewController
        self.castDetailViewController = castDetailViewController
    }
    
    static func createModule(content: DetailModel, contentType: DataType) -> UIViewController {
        let viewController = DetailViewController()
        let router: DetailPresenterToRouterProtocol = DetailRouter(viewController: viewController)
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let presenter: DetailPresenterType = DetailPresenter(view: viewController,
                                                             router: router,
                                                             interactor: interactor,
                                                             content: content,
                                                             contentDataType: contentType)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
    func navigateToCastDetail(dataType: DataType, cast: Person) {
        
        DispatchQueue.main.async { [weak self] in
            guard let viewController = self?.viewController else {
                return
            }
            guard let castDetailViewController = self?.castDetailViewController else {
                let castDetailViewController = CastDetailRouter.createModule(type: dataType, 
                                                                             cast: cast)
                self?.castDetailViewController = castDetailViewController
                castDetailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "arrow.left"),
                    style: .done,
                    target: self,
                    action: #selector(self?.backButtontapped(_:))
                )
                viewController.navigationController?.pushViewController(castDetailViewController,
                                                                        animated: true)
                return
            }
            
            let castDetailView = castDetailViewController as? CastDetailPresenterToViewProtocol
            castDetailView?.presenter?.configCastDetailContent(castType: dataType, cast: cast)
            viewController.navigationController?.pushViewController(castDetailViewController,
                                                                           animated: true)
        }
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
