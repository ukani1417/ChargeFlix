//
//  HomePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit
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
    
    func onfetchMovieByIdSuccess(data: Movie)
    func onfetchMovieBYIdFailure()
    
    func onFetchMovieFailure(movieType: MovieType)
//    func onFetchTVShowFailure(tvShowType: TVShowType)
    func onFetchMovieGenreListFailure()
}

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    
    var moviesData: [MovieData] = []
    var filteredData: [MovieData] = []
    
    var tvShowsData: [TVShowData] = []
    var filteredTVShowsData: [TVShowData] = []
    
    private var movieGenreList: MovieGenreList?
        
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, 
         interactor: HomeInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getMovieGenreList()
        MovieType.allCases.forEach { type in
            interactor?.getMovies(type: type)
        }
//        TVShowType.allCases.forEach { type in
//            interactor?.getTVShows(type: type)
//        }
    }
    
    // Api Success
    
    func onfetchMovieSuccess(movieType: MovieType, data: [ListObj]) {
        moviesData.append(MovieData(type: movieType, data: data))
        filteredData.append(MovieData(type: movieType, data: data))
        if movieType == .populer {
            setupHeaderView()
        }
        view?.reloadTable()
    }
    
    func onfetchTVShowSuccess(tvShowType: TVShowType, data: [ListObj]) {
        tvShowsData.append(TVShowData(type: tvShowType, data: data))
        filteredTVShowsData.append(TVShowData(type: tvShowType, data: data))
        view?.reloadTable()
    }
    
    func onFetchMovieGenreListSuccess(data: MovieGenreList) {
        movieGenreList = data
    }
    
    // HomeTableHeaderView Setup
    private func setupHeaderView() {
        let data = filteredData.first(where: { $0.type == .populer })?.data ?? []
        if data.isEmpty {
            return
        }
        let randomIndex = Int.random(in: 0..<(data.count ))
        let movie = data[randomIndex]
        let voteaverage = ((movie.voteAverage ?? 0.0)/2.0)
        let rounded: Double = voteaverage.rounded(.down)
        let fullStar: Int = Int(rounded)
        var halfStar: Int = 0
        
        if rounded != voteaverage && rounded != 5 {
            halfStar = 1
        }
        let input: TableHeaderInput = TableHeaderInput(title: movie.title ?? "",
                                                       poster:  movie.backdropPath ?? "",
                                                       votes: String(movie.voteCount ?? 0) + " Votes",
                                                       fullStar: fullStar,
                                                       halfStar: halfStar,
                                                       genreList: movieGenreList?.genres ?? [])
        view?.setupHeaderView(input: input)
    }

    // Api failure
    
    func onFetchMovieFailure(movieType: MovieType) {
        switch movieType {
        case .populer:
            view?.onFetchFailure(message: "Failed in popular movies")
        case .topRated:
            view?.onFetchFailure(message: "Failed in topRated movies")
        case .upcoming:
            view?.onFetchFailure(message: "Failed in upComing movies")
        case .nowPlaying:
            view?.onFetchFailure(message: "Failed in nowPlaying movies")
        }
    }
    
    func onFetchTVShowFailure(tvShowType: TVShowType) {
        switch tvShowType {
        case .populer:
            view?.onFetchFailure(message: "Failed in popular TVShow")
        case .topRated:
            view?.onFetchFailure(message: "Failed in topRated TVSHow")
        }
    }

    func onFetchMovieGenreListFailure() {
        view?.onFetchFailure(message: "Failed in fetching genre list")
    }
    
    //    Table DataSource & Delegate
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat {
        return 30.0
    }
    
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
    
    func numsOfSection() -> Int {
        return filteredData.count
    }
    
    func numsOfRows(section: Int) -> Int {
        return 1
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifire, 
                                                       for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.configContent(data: filteredData.first(where: { $0.type == .populer })?.data ?? [], 
                               delegate: self as CollectionViewToPresenter)
        case 1:
            cell.configContent(data: filteredData.first(where: { $0.type == .topRated })?.data ?? [], 
                               delegate: self as CollectionViewToPresenter)
        case 2:
            cell.configContent(data: filteredData.first(where: { $0.type == .upcoming })?.data ?? [], 
                               delegate: self as CollectionViewToPresenter)
        case 3:
            cell.configContent(data: filteredData.first(where: { $0.type == .nowPlaying })?.data ?? [], 
                               delegate: self as CollectionViewToPresenter)
        case 4:
            cell.configContent(data: filteredTVShowsData.first(where: { $0.type == .populer })?.data ?? [],
                               delegate: self as CollectionViewToPresenter)
            
        case 5:
            cell.configContent(data: filteredTVShowsData.first(where: { $0.type == .topRated })?.data ?? [],
                               delegate: self as CollectionViewToPresenter)
        default: break
        }
        return cell
    }
    
    // Table section header setup
    func setupHeaderView(section: Int) -> UIView {
        let header = TableSectionHeaderView()
        header.delegate = self as TableSectionHeaderViewToPresenter
        switch section {
        case 0: header.configContent(sectionTitle: "Popular", section: section)
        case 1: header.configContent(sectionTitle: "Top Rated", section: section)
        case 2: header.configContent(sectionTitle: "UpComing", section: section)
        case 3: header.configContent(sectionTitle: "In Theaters", section: section)
        case 4: header.configContent(sectionTitle: "Popular TVShows", section: section)
        case 5: header.configContent(sectionTitle: "Top Rated TVShows", section: section)
        default: break
        }
        return header
    }
    
    // Filtering data on the basis of genre id
    func filterDataUsingGenre(index: Int) {
        if index == 0 {
            filteredData = moviesData
        } else {
            let genreId = movieGenreList?.genres[index-1].id
            for listIndex in 0..<(moviesData.count) {
                filteredData[listIndex].data.removeAll()
                filteredData[listIndex].data = moviesData[listIndex].data.filter({ movie in
                    return movie.genre?.contains(where: { $0 == genreId}) ?? false
                })
            }
        }
        view?.reloadTable()
    }
    
    func onfetchMovieByIdSuccess(data: Movie) {
        view?.hideActivity()
        router?.pushToMovieDetail(with: data)
    }
    
    func onfetchMovieBYIdFailure() {
        view?.hideActivity()
    }
    
}

// for didselect from CustomCollectionView
extension HomePresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        if id != -1 {
            view?.showActity()
            interactor?.getMovieById(id: id)
        }
    }
}

// for showAll from table sectionheader
extension HomePresenter: TableSectionHeaderViewToPresenter {
    func showAll(section: Int) {
        var data = [ListObj]()
        var type = "Movies"
        
        switch section {
        case 0:
            data = filteredData.first(where: { $0.type == .populer })?.data ?? []
            type = "Popular"
        case 1:
            data = filteredData.first(where: { $0.type == .topRated })?.data ?? []
            type = "Top Rated"
        case 2:
            data = filteredData.first(where: { $0.type == .upcoming })?.data ?? []
            type = "Up Coming"
        case 3:
            data = filteredData.first(where: { $0.type == .nowPlaying })?.data ?? []
            type = "In Theaters"
        default:
            break
        }
        router?.switchToMovieModule(type: type, data: data)
    }
}
