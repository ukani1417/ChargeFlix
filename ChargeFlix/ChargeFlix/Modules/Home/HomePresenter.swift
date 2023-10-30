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
    var moviesList: MovieList?
    
    private var popularMovieList: PopularMoviesList?
    private var topRateMovieList: TopRatedMoviesList?
    private var upComingMovieList: UpcomingMoviesList?
    private var nowPlayingMovieList: NowPlayingMoviesList?
    
    private var filteredPopularMovieList: [ListObj] = []
    private var filteredTopRateMovieList: [ListObj] = []
    private var filteredUpComingMovieList: [ListObj] = []
    private var filteredNowPlayingMovieList: [ListObj] = []
    
    private var movieGenreList: MovieGenreList?
    
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, interactor: HomeInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getMovieGenreList()
        interactor?.getPopularMovies()
        interactor?.getTopRatedMovies()
        interactor?.getUpComingMovies()
        interactor?.getNowPlayingMovies()
    }
    
    // Api Success
    
    func onFetchPopularMovieListSuccess() {
        
        popularMovieList = interactor?.popularMovieList
        filteredPopularMovieList = popularMovieList?.ToListObj() ?? []
        view?.reloadTable()
        
        let voteaverage = ((popularMovieList?.list?[0].voteAvarage ?? 0.0)/2.0)
        let rounded: Double = voteaverage.rounded(.down)
        
        let fullStar: Int = Int(rounded)
        var halfStar: Int = 0
        
        if rounded != voteaverage && rounded != 5 {
            halfStar = 1
        }
    
        view?.setupHeaderView(title: popularMovieList?.list?[0].originalTitle ?? "",
                              poster: popularMovieList?.list?[0].backdropPath ?? "",
                              votes: String(popularMovieList?.list?[0].voteCount ?? 0) + " Votes",
                              fullStar: fullStar,
                              halfStar: halfStar)
    }
    
    func onFetchTopRatedMovieListSuccess() {
        topRateMovieList = interactor?.topRateMovieList
        filteredTopRateMovieList = topRateMovieList?.ToListObj() ?? []
        view?.reloadTable()
    }
    
    func onFetchUpComingMovieListSuccess() {
        upComingMovieList = interactor?.upComingMovieList
        filteredUpComingMovieList = upComingMovieList?.ToListObj() ?? []
        view?.reloadTable()
    }
    
    func onFetchNowPlayingMovieListSuccess() {
        nowPlayingMovieList = interactor?.nowPlayingMovieList
        filteredNowPlayingMovieList = nowPlayingMovieList?.ToListObj() ?? []
        view?.reloadTable()
    }
    
    func onFetchMovieGenreListSuccess() {
        movieGenreList = interactor?.movieGenreList
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
    
    func onFetchMovieGenreListFailure() {
        
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
        
        switch indexPath.section {
        case 0: cell.configContent(data: filteredPopularMovieList)
        case 1: cell.configContent(data: filteredTopRateMovieList)
        case 2: cell.configContent(data: filteredUpComingMovieList)
        case 3: cell.configContent(data: filteredNowPlayingMovieList)
        default: break
        }
        
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
    
    func filterDataFromGenre(index: Int) {
        let genreId = movieGenreList?.genres[index].id
//        view?.reloadTable()
    }
    
    func numsOfRowsInGenreCollection(section: Int) -> Int {
        return movieGenreList?.genres.count ?? 0
    }
    
    func setupGenreCollectionCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionCell.identifire, for: indexPath) as? GenreCollectionCell else {
            return UICollectionViewCell()
        }
        cell.configCellContent(genre: movieGenreList?.genres[indexPath.row].name ?? "")
        return cell
    }
    
    //    Collection Data Source & Delegate
    
    func numsOfSectionInCollection(sectionForCollection: Int) -> Int {
        return 1
    }
    
    func numsOfRowsCollectionSection(section: Int, sectionForCollection: Int) -> Int {
        switch sectionForCollection {
        case 0: return filteredPopularMovieList.count
        case 1: return filteredTopRateMovieList.count
        case 2: return filteredUpComingMovieList.count
        case 3: return filteredNowPlayingMovieList.count
        default: return 0
        }
    }
    
    func setupCollectionCell(collectionView: UICollectionView, indexPath: IndexPath, sectionForCollection: Int) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
       
        switch sectionForCollection {
        case 0: 
            cell.configCellContent(title: filteredPopularMovieList[indexPath.row].title ?? "", posterPath: filteredPopularMovieList[indexPath.row].posterPath ?? "" )
        case 1:
            cell.configCellContent(title: filteredTopRateMovieList[indexPath.row].title ?? "", posterPath: filteredTopRateMovieList[indexPath.row].posterPath ?? "")
        case 2:
            cell.configCellContent(title: filteredUpComingMovieList[indexPath.row].title ?? "", posterPath: filteredUpComingMovieList[indexPath.row].posterPath ?? "")
        case 3:
            cell.configCellContent(title: filteredNowPlayingMovieList[indexPath.row].title ?? "", posterPath: filteredNowPlayingMovieList[indexPath.row].posterPath ?? "")
        default: break
        }
        
        return cell
    }
}
