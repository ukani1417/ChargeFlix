//
//  TVShowProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol TVShowViewInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
    
    func showActivity()
    func hideActivity()
    
    func onFetchPopularTVShowsListSuccess(list: [ListObj])
    func onFetchPopularTVShowsListFailure()
}
