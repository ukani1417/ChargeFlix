//
//  HomeProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    var presenter: HomePresenterInterface? { get set }
    
    func showActity()
    func hideActivity()
    func reloadTable()
    func setupHeaderView(input: TableHeaderInput)
    func onFetchFailure(message: String)
}

protocol HomePresenterInterface: AnyObject {
    var view: HomeViewInterface? { get set }
    var router: HomeRouterInterface? { get set }
    var interactor: HomeInteractorInterface? { get set }
    
    func viewDidLoad()
    
//   for  tableView
    func numsOfSection() -> Int
    func numsOfRows(section: Int) -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat
    func setupHeaderView(section: Int) -> UIView
    func filterDataUsingGenre(index: Int)
      
//  Api Callbacks
    func onfetchMovieSuccess(movieType: MovieType, data: [ListObj])
//    func onfetchTVShowSuccess(tvShowType: TVShowType, data: [ListObj])
    func onFetchMovieGenreListSuccess(data: MovieGenreList)
    
    func onFetchMovieFailure(movieType: MovieType)
//    func onFetchTVShowFailure(tvShowType: TVShowType)
    func onFetchMovieGenreListFailure()
}

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    var movieRepository: MovieRepository? { get set }
    var tvShowRepositoy: TVShowRepository? { get set }
    
    func getMovies(type: MovieType)
//    func getTVShows(type: TVShowType)
    func getMovieGenreList()
}

protocol HomeRouterInterface {
    var viewController: UINavigationController? { get set }
    func switchToMovieModule(data: [ListObj])
    
}
