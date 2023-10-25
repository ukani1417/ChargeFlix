//
//  HomePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit
import Combine

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    
    private var popularMovieList: PopularMoviesList?
    private var topRateMovieList: TopRatedMoviesList?
    private var upComingMovieList: UpcomingMoviesList?
    private var nowPlayingMovieList: NowPlayingMoviesList?
    
//    private var popularMoviePublisher = PassthroughSubject<PopularMoviesList, Error>()
//    private var topRateMoviePublisher = PassthroughSubject<TopRatedTVShows, Error>()
//    private var upComingMoviePublisher = PassthroughSubject<UpcomingMoviesList, Error>()
//    private var nowPlayingMoviePublisher = PassthroughSubject<NowPlayingMoviesList, Error>()
//    
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, interactor: HomeInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getPopularMovies()
        interactor?.getTopRatedMovies()
        interactor?.getUpComingMovies()
        interactor?.getNowPlayingMovies()
    }
    
    func onFetchPopularMovieListSuccess() {
        popularMovieList = interactor?.popularMovieList
        view?.onFetchPopularMovieListSuccess()
    }
    
    func onFetchTopRatedMovieListSuccess() {
        topRateMovieList = interactor?.topRateMovieList
        view?.onFetchTopRatedMovieListSuccess()
    }
    
    func onFetchUpComingMovieListSuccess() {
        upComingMovieList = interactor?.upComingMovieList
        view?.onFetchUpComingMovieListSuccess()
    }
    
    func onFetchNowPlayingMovieListSuccess() {
        nowPlayingMovieList = interactor?.nowPlayingMovieList
        view?.onFetchNowPlayingMovieListSuccess()
    }
    
    func onFetchPopularMovieListFailure() {
        view?.onFetchPopularMovieListFailure()
    }
    
    func onFetchTopRatedMovieListFailure() {
        view?.onFetchTopRatedMovieListFailure()
    }
    
    func onFetchUpComingMovieListFailure() {
        view?.onFetchUpComingMovieListFailure()
    }
    
    func onFetchNowPlayingMovieListFailure() {
        view?.onFetchNowPlayingMovieListFailure()
    }
    
//    Table DataSource & Delegate
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat {
        return 30.0
    }
    
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func numsOfSection() -> Int {
        return 4
    }
    
    func numsOfRows(section: Int) -> Int {
        return 1
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print(indexPath.section)
        switch indexPath.section {
        case 0: cell.textLabel?.text = String(popularMovieList?.list?.count ?? 0)
        case 1: cell.textLabel?.text = String(topRateMovieList?.list?.count ?? 0)
        case 2: cell.textLabel?.text = String(upComingMovieList?.list?.count ?? 0)
        case 3: cell.textLabel?.text = String(nowPlayingMovieList?.list?.count ?? 0)
        default: cell.textLabel?.text = "Not matching case"
        }
        
        return cell
    }
    
    func titleForHeaderSectionAt(tableView: UITableView, section: Int) -> String {
        switch section {
        case 0: return String("Populer Movies")
        case 1: return String("Top Movies")
        case 2: return String("UpComing")
        case 3: return String("In Theaters")
        default: return  "Not matching case"
        }
    }
}
