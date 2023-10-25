//
//  MovieProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol MovieViewInterface: AnyObject {
    var presenter: MoviePresenterInterface? { get set }
}

protocol MoviePresenterInterface: AnyObject {
    var view: MovieViewInterface? { get set }
    var router: MovieRouterInterface? { get set }
    var interactor: MovieInteractorInterface? { get set }
}

protocol MovieInteractorInterface: AnyObject {
    var presenter: MoviePresenterInterface? { get set }
}

protocol MovieRouterInterface: AnyObject {
    
}
