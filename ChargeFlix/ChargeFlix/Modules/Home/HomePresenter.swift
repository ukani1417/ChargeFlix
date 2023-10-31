//
//  HomePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit
import Combine

enum MovieType {
    case populer
    case topRated
    case upcoming
    case nowPlaying
}

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    
    var moviessList = [[ListObj]](repeating: [], count: 4)
    var filteredMoviesList = [[ListObj]](repeating: [], count: 4)
    
    var moviesData: [MovieData] = []
    var filteredData: [MovieData] = []
    
    private var movieGenreList: MovieGenreList?
        
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, 
         interactor: HomeInteractorInterface? = nil) {
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
    
    func onfetchSuccess(movieType: MovieType, data: [ListObj]) {
        moviesData.append(MovieData(type: movieType, data: data))
        filteredData.append(MovieData(type: movieType, data: data))
        
        if movieType == .populer {
            setupHeaderView()
        }
        view?.reloadTable()
    }
    
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
        print(movie)
        let input: TableHeaderInput = TableHeaderInput(title: movie.title ?? "",
                                                       poster:  movie.backdropPath ?? "",
                                                       votes: String(movie.voteCount ?? 0) + " Votes",
                                                       fullStar: fullStar,
                                                       halfStar: halfStar,
                                                       genreList: movieGenreList?.genres ?? [])
        view?.setupHeaderView(input: input)
    }

    func onFetchMovieGenreListSuccess(data: MovieGenreList) {
        movieGenreList = data
    }
    
    // Api failure
    
    func onFetchFailure(movieType: MovieType) {
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
        return 4
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
            cell.configContent(data: filteredData.first(where: { $0.type == .populer })?.data ?? [])
        case 1:
            cell.configContent(data: filteredData.first(where: { $0.type == .topRated })?.data ?? [])
        case 2:
            cell.configContent(data: filteredData.first(where: { $0.type == .upcoming })?.data ?? [])
        case 3:
            cell.configContent(data: filteredData.first(where: { $0.type == .nowPlaying })?.data ?? [])
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
    
}
