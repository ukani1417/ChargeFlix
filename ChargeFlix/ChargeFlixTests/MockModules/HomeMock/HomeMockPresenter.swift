//
//  HomeMockPresenter.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
import UIKit
@testable import ChargeFlix

class HomeMockPresenter: HomeViewToPresenterProtocol, HomeInteractorToPresenterProtocol {
    var view: ChargeFlix.HomePresenterToViewProtocol?
    var router: ChargeFlix.HomePresenterToRouterProtocol?
    var interactor: ChargeFlix.HomePresenterToInteractorProtocol?
    
    var data: Codable?
    var error: HomePresenterError?
    
    init(view: ChargeFlix.HomePresenterToViewProtocol? = nil, router: ChargeFlix.HomePresenterToRouterProtocol? = nil, interactor: ChargeFlix.HomePresenterToInteractorProtocol? = nil, data: Codable? = nil, error: HomePresenterError? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.data = data
        self.error = error
    }
    
    func viewDidLoad() {
    }
    
    func numsOfSection() -> Int {
        return 0
    }
    func numsOfRows(section: Int) -> Int {
        return 0
    }
    func configTableCell(section: Int) -> (data: [ChargeFlix.ContentObject], 
                                           delegate: ChargeFlix.CollectionViewToPresenter?) {
        return ([], nil)
    }
    func filterDataUsingGenre(index: Int) {
    }
    func setupSectionHeaderView(section: Int) -> String {
        return ""
    }
    
    func onFetchMovies(dataType: ChargeFlix.DataType, responce: Result<ChargeFlix.CommonListModel, ChargeFlix.HomePresenterError>) {
        switch responce {
        case .success(let data):
            self.data = data
        case .failure(let error):
            self.error = error
        }
    }
    
    func onFetchMovie(forUse: ChargeFlix.ForUse, responce: Result<ChargeFlix.DetailModel, ChargeFlix.HomePresenterError>) {
        switch responce {
        case .success(let data):
            self.data = data
        case .failure(let error):
            self.error = error
        }
    }
    
    func onFetchGenre(responce: Result<ChargeFlix.GenreList, ChargeFlix.HomePresenterError>) {
        switch responce {
        case .success(let data):
            self.data = data
        case .failure(let error):
            self.error = error
        }
    }
    
    
    
}
