//
//  HomeMockPresenter.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
import UIKit
@testable import ChargeFlix

class HomeMockPresenter: HomePresenterProtocol {
    var view: ChargeFlix.HomeViewProtocol?
    var router: ChargeFlix.HomeRouterProtocol?
    var interactor: ChargeFlix.HomeInteractorProtocol?
    
    func viewDidLoad() {
        
    }

//  Presenter -> View
    func numsOfSection() -> Int {
        return 0
    }
    func numsOfRows(section: Int) -> Int {
        return 0
    }
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 0.0
    }
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat {
        return 0.0
    }
    func setupHeaderView(section: Int) -> UIView {
        return UIView()
    }
    func filterDataUsingGenre(index: Int) {
        
    }
    
//    Interactor --> Presenter
    
    func onFetchMovies(dataType: ChargeFlix.DataType, 
                       responce: Result<ChargeFlix.CommonListModel, ChargeFlix.HomePresenterError>) {
        
    }
    
    func onFetchMovie(forUse: ChargeFlix.ForUse, 
                      responce: Result<ChargeFlix.DetailModel, ChargeFlix.HomePresenterError>) {
        
    }
    
    func onFetchGenre(responce: Result<ChargeFlix.GenreList, ChargeFlix.HomePresenterError>) {
        
    }
    
    
}
