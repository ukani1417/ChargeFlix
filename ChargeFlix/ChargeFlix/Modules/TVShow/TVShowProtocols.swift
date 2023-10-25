//
//  TVShowProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol TVShowViewInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
}

protocol TVShowPresenterInterface: AnyObject {
    var view: TVShowViewInterface? { get set }
    var router: TVShowRouterInterface? { get set }
    var interactor: TVShowInteractorInterface? { get set }
}

protocol TVShowInteractorInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
}

protocol TVShowRouterInterface: AnyObject {
    
}
