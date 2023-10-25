//
//  HomeProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    var presenter: HomePresenterInterface? { get set }
  
    func onFetchPopularMovieListSuccess()
    func onFetchTopRatedMovieListSuccess()
    func onFetchUpComingMovieListSuccess()
    func onFetchNowPlayingMovieListSuccess()
    
    func onFetchPopularMovieListFailure()
    func onFetchTopRatedMovieListFailure()
    func onFetchUpComingMovieListFailure()
    func onFetchNowPlayingMovieListFailure()
}

protocol HomePresenterInterface: AnyObject {
    var view: HomeViewInterface? { get set }
    var router: HomeRouterInterface? { get set }
    var interactor: HomeInteractorInterface? { get set }
    
    func viewDidLoad()
    
    func numsOfSection() -> Int
    func numsOfRows(section: Int) -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat
    func titleForHeaderSectionAt(tableView: UITableView, section: Int) -> String
    
    func onFetchPopularMovieListSuccess()
    func onFetchTopRatedMovieListSuccess()
    func onFetchUpComingMovieListSuccess()
    func onFetchNowPlayingMovieListSuccess()
    
    func onFetchPopularMovieListFailure()
    func onFetchTopRatedMovieListFailure()
    func onFetchUpComingMovieListFailure()
    func onFetchNowPlayingMovieListFailure()
}

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    var repository: MovieRepository? { get set }
    var popularMovieList: PopularMoviesList? { get set }
    var topRateMovieList: TopRatedMoviesList? { get set }
    var upComingMovieList: UpcomingMoviesList? { get set }
    var nowPlayingMovieList: NowPlayingMoviesList? { get set }
    
    func getPopularMovies() 
    func getTopRatedMovies()
    func getUpComingMovies()
    func getNowPlayingMovies()
}

protocol HomeRouterInterface {
    
}
