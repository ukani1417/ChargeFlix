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
    
    private var filteredPopularMovieList: PopularMoviesList?
    private var filteredTopRateMovieList: TopRatedMoviesList?
    private var filteredUpComingMovieList: UpcomingMoviesList?
    private var filteredNowPlayingMovieList: NowPlayingMoviesList?
    
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
        filteredPopularMovieList = interactor?.popularMovieList
        view?.reloadTable()
        
        let voteaverage = ((filteredPopularMovieList?.list?[0].voteAvarage ?? 0.0)/2.0)
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
        filteredTopRateMovieList = interactor?.topRateMovieList
        view?.reloadTable()
    }
    
    func onFetchUpComingMovieListSuccess() {
        upComingMovieList = interactor?.upComingMovieList
        filteredUpComingMovieList = interactor?.upComingMovieList
        view?.reloadTable()
    }
    
    func onFetchNowPlayingMovieListSuccess() {
        nowPlayingMovieList = interactor?.nowPlayingMovieList
        filteredNowPlayingMovieList = interactor?.nowPlayingMovieList
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
    
    func filterDataFromGenre(indexPath: IndexPath) {
        let index = indexPath.row
        let genreId = movieGenreList?.genres[index].id
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
