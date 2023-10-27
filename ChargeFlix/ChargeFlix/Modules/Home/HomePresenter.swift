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
    
    // Api Success
    
    func onFetchPopularMovieListSuccess() {
        popularMovieList = interactor?.popularMovieList
        view?.reloadTable()
        view?.setupHeaderView(title: popularMovieList?.list?[0].originalTitle ?? "", poster: popularMovieList?.list?[0].backdropPath ?? "")
    }
    
    func onFetchTopRatedMovieListSuccess() {
        topRateMovieList = interactor?.topRateMovieList
        view?.reloadTable()
    }
    
    func onFetchUpComingMovieListSuccess() {
        upComingMovieList = interactor?.upComingMovieList
        view?.reloadTable()
    }
    
    func onFetchNowPlayingMovieListSuccess() {
        nowPlayingMovieList = interactor?.nowPlayingMovieList
        view?.reloadTable()
    }
    
    // Api failure
    
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
        return 210.0
    }
    
    func numsOfSection() -> Int {
        return 4
    }
    
    func numsOfRows(section: Int) -> Int {
        return 1
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifire, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.viewController = view as? MovieTableCellToView
        cell.sectionForCollection = indexPath.section
        return cell
    }
    
    func setupHeaderView(section: Int) -> UIView {
        let header = TableSectionHeaderView()
        switch section {
        case 0: header.configContent(sectionTitle: "Populer Movies", section: section)
        case 1: header.configContent(sectionTitle: "Top Movies", section: section)
        case 2: header.configContent(sectionTitle: "UpComing", section: section)
        case 3: header.configContent(sectionTitle: "In Theaters", section: section)
        default: break
        }
        return header
    }
    
    //    Collection Data Source & Delegate
    
    func numsOfSectionInCollection(sectionForCollection: Int) -> Int {
        return 1
    }
    
    func numsOfRowsCollectionSection(section: Int, sectionForCollection: Int) -> Int {
        switch sectionForCollection {
        case 0: return popularMovieList?.list?.count ?? 0
        case 1: return topRateMovieList?.list?.count ?? 0
        case 2: return upComingMovieList?.list?.count ?? 0
        case 3: return nowPlayingMovieList?.list?.count ?? 0
        default: return 0
        }
    }
    
    func setupCollectionCell(collectionView: UICollectionView, indexPath: IndexPath, sectionForCollection: Int) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
       
        switch sectionForCollection {
        case 0: 
            cell.configCellContent(title: popularMovieList?.list?[indexPath.row].originalTitle ?? "", posterPath: popularMovieList?.list?[indexPath.row].posterPath ?? "")
        case 1: 
            cell.configCellContent(title: topRateMovieList?.list?[indexPath.row].originalTitle ?? "", posterPath: topRateMovieList?.list?[indexPath.row].posterPath ?? "")
        case 2: 
            cell.configCellContent(title: upComingMovieList?.list?[indexPath.row].originalTitle ?? "", posterPath: upComingMovieList?.list?[indexPath.row].posterPath ?? "")
        case 3: 
            cell.configCellContent(title: nowPlayingMovieList?.list?[indexPath.row].originalTitle ?? "", posterPath: nowPlayingMovieList?.list?[indexPath.row].posterPath ?? "")
        default: break
        }
        
        return cell
    }
}
