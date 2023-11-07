//
//  HomePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    
    weak var view: HomePresenterToViewProtocol?
    var router: HomePresenterToRouterProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var intialAPICalls: Int = 0
    private(set) var moviesDetails = [DataType:[ContentObject]]()
    private(set) var filteredMoviesDetails = [DataType:[ContentObject]]()
    private(set) var movieGenreList: GenreList?
    private(set) var randomMovie: DetailModel?
    private(set) var headerSetuped: Bool = false
    private(set) var error: HomePresenterError?
    private(set) var movieDetail: DetailModel?
    
    init(view: HomePresenterToViewProtocol? = nil, router: HomePresenterToRouterProtocol? = nil,
         interactor: HomePresenterToInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getGenreList(type: .movieGenreList)
        [DataType.popularMovies,
         DataType.topRatedMovies,
         DataType.upcomingMovies,
         DataType.nowPlayingMovies].forEach { type in
             interactor?.getMovies(type: type, page: 1)
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
    
    func numsOfSection() -> Int {
        return filteredMoviesDetails.count
    }
    
    func numsOfRows(section: Int) -> Int {
        return 1
    }
    
    func configTableCell(section: Int) -> (data: [ContentObject], delegate: CollectionViewToPresenter?) {
        switch section {
        case 0:
            return (data: filteredMoviesDetails[.popularMovies] ?? [] ,
                               delegate: self as CollectionViewToPresenter)
        case 1:
           return (data: filteredMoviesDetails[.topRatedMovies] ?? [],
                               delegate: self as CollectionViewToPresenter)
        case 2:
           return (data: filteredMoviesDetails[.upcomingMovies] ?? [],
                               delegate: self as CollectionViewToPresenter)
        case 3:
            return (data: filteredMoviesDetails[.nowPlayingMovies] ?? [],
                               delegate: self as CollectionViewToPresenter)
        default:
            return ([], nil)
        }
    }
    
    // Table section header setup
    func setupSectionHeaderView(section: Int) -> String {
        switch section {
        case 0: return ("Popular")
        case 1: return ("Top Rated")
        case 2: return ("UpComing")
        case 3: return ("In Theaters")
        default:return ("SectionTitle")
        }
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
    
    func tappedOnMoviePoster() {
        guard let movie = randomMovie else { return }
        router?.navigateToMovieDetail(with: movie)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
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
            self.error = error
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
                view?.hideActivity()
                movieDetail = data
                router?.navigateToMovieDetail(with: data)
            }
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchGenre(responce: Result<GenreList, HomePresenterError>) {
        switch responce {
        
        case .success(let data):
            movieGenreList = data
            view?.setupGenreListInHeader(genreList: data.genres )
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
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
                router?.navigateToMovieTab(type: type, data: data)
    }
}
