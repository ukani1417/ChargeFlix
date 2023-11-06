//
//  HomePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    
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
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, HomePresenterError>)
    func onFetchMovie(forUse: ForUse, responce: Result<DetailModel, HomePresenterError>)
    func onFetchGenre(responce: Result<GenreList, HomePresenterError>)
    
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    private var moviesDetails = [DataType:[ContentObject]]()
    private var filteredMoviesDetails = [DataType:[ContentObject]]()
    private var movieGenreList: GenreList?
    private var randomMovie: DetailModel?
    private var headerSetuped: Bool = false
    
    init(view: HomeViewProtocol? = nil, router: HomeRouterProtocol? = nil,
         interactor: HomeInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getGenreList(type: .movieGenreList)
        [
         DataType.popularMovies,
         DataType.topRatedMovies,
         DataType.upcomingMovies,
         DataType.nowPlayingMovies].forEach { type in
             interactor?.getMovies(type: type, page: 1)
        }
    }
    
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, HomePresenterError>) {
        switch responce {
        case .success(let data):
            moviesDetails[dataType] = data.results
            filteredMoviesDetails[dataType] = data.results
            
//            TableHeaderView Setup from random data 
            if headerSetuped == false, moviesDetails.isEmpty == false, let keyIndex = moviesDetails.keys.first {
                if let id = moviesDetails[keyIndex]?.randomElement()?.id {
                    headerSetuped = true
                    interactor?.getMovie(forUse: ForUse.setupHeader, type: .movieDetail, id: id)
                }
            }
            if filteredMoviesDetails.count == 4 {
                view?.reloadTable()
            }
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchMovie(forUse: ForUse, responce: Result<DetailModel, HomePresenterError>) {
        switch responce {
        case .success(let data):
            switch forUse {
            case .setupHeader:
                randomMovie = data
                setupHeaderView(with: data)
            case .pushToDetail:
                router?.pushToMovieDetail(with: data)
            }
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchGenre(responce: Result<GenreList, HomePresenterError>) {
        switch responce {
        case .success(let data):
            movieGenreList = data
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    // HomeTableHeaderView Setup
    private func setupHeaderView(with movie: DetailModel) {
        
        let input: TableHeaderInput = TableHeaderInput(title: movie.originalTitle ?? "",
                                                       poster:  movie.backdropPath ?? "",
                                                       votes: String(movie.voteCount ?? 0) + " Votes",
                                                       starts: movie.getRating(),
                                                       genreList: movieGenreList?.genres ?? [])
        view?.setupHeaderView(input: input)
    }
    
    //    Table DataSource & Delegate
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat {
        return 30.0
    }
    
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
    
    func numsOfSection() -> Int {
        return filteredMoviesDetails.count
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
            cell.configContent(data: filteredMoviesDetails[.popularMovies] ?? [] ,
                               delegate: self as CollectionViewToPresenter)
        case 1:
            cell.configContent(data: filteredMoviesDetails[.topRatedMovies] ?? [],
                               delegate: self as CollectionViewToPresenter)
        case 2:
            cell.configContent(data: filteredMoviesDetails[.upcomingMovies] ?? [],
                               delegate: self as CollectionViewToPresenter)
        case 3:
            cell.configContent(data: filteredMoviesDetails[.nowPlayingMovies] ?? [],
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
            
        default: break
        }
        return header
    }
    
    // Filtering data on the basis of genre id
    func filterDataUsingGenre(index: Int) {
        if index == 0 {
            filteredMoviesDetails = moviesDetails
        } else {
            let genreId = movieGenreList?.genres[index-1].id
            [DataType.popularMovies,
             DataType.topRatedMovies,
             DataType.upcomingMovies,
             DataType.nowPlayingMovies].forEach { type in
                filteredMoviesDetails[type] = moviesDetails[type]?.filter({ movie in
                    return movie.genres?.contains(where: { $0 == genreId}) ?? false
                })
            }
        }
        view?.reloadTable()
    }
}

// for didselect from CustomCollectionView
extension HomePresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        if id != -1 {
            view?.showActity()
            interactor?.getMovie(forUse: .pushToDetail, type: .movieDetail, id: id)
        }
    }
}

// for showAll from table sectionheader
extension HomePresenter: TableSectionHeaderViewToPresenter {
    func showAll(section: Int) {
        var data = [ContentObject]()
        var type = "Movies"
        
        switch section {
        case 0:
            data = filteredMoviesDetails[.popularMovies] ?? []
            type = "Popular"
        case 1:
            data = filteredMoviesDetails[.topRatedMovies] ?? []
            type = "Top Rated"
        case 2:
            data = filteredMoviesDetails[.upcomingMovies] ?? []
            type = "Up Coming"
        case 3:
            data = filteredMoviesDetails[.nowPlayingMovies] ?? []
            type = "In Theaters"
        default:
            break
        }
                router?.switchToMovieModule(type: type, data: data)
    }
}
