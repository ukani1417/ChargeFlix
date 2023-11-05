//
//  MovieDetailRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import UIKit

protocol DetailRouterProtocol {
    var viewController: UIViewController? { get set }
    func pushToCastDetail(dataType: DataType, cast: Person)
}

class DetailRouter: DetailRouterProtocol {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createModule(movie: DetailModel, contentType: DataType) -> UIViewController {
        let viewController = DetailViewController()
        let router: DetailRouterProtocol = DetailRouter(viewController: viewController)
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let presenter: DetailPresenterProtocol = DetailPresenter(view: viewController,
                                                                 router: router, 
                                                                 interactor: interactor,
                                                                 content: movie,
        contentDataType: contentType)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
    func pushToCastDetail(dataType: DataType, cast: Person) {
        DispatchQueue.main.async {
            guard let viewController = self.viewController else {
                return
            }
            
            let destinationVC = CastDetailRouter.createModule(type: dataType, cast: cast)
            viewController.navigationController?.pushViewController(destinationVC, animated: true)
            
            destinationVC.setBackButton(methode: #selector(self.backButtontapped(_:)), title: cast.name ?? "")
        }
    }
    @objc private func backButtontapped(_ sender: UIViewController) {
            DispatchQueue.main.async { [weak self] in
                self?.viewController?.navigationController?.popViewController(animated: true)
            }
        }
}
