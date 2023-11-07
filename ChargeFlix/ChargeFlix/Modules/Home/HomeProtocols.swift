//
//  HomeProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation

// Presenter -> View
protocol HomePresenterToViewProtocol: AnyObject {
    var presenter: HomeViewToPresenterProtocol? { get set }
    
    func showActity()
    func hideActivity()
    func reloadTable()
    func setupHeaderView(input: TableHeaderInput)
    func setupGenreListInHeader(genreList: [Genre])
    func onFetchFailure(message: String)
}

// Presenter -> Interactor
protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }
    
    func getMovies(type: DataType, page: Int)
    func getMovie(forUse: ForUse, type: DataType, id: Int)
    func getGenreList(type: DataType)
}
// Presenter -> Router
protocol HomePresenterToRouterProtocol: AnyObject {
    
    func navigateToMovieTab(type: String, data: [ContentObject])
    func navigateToMovieDetail(with movie: DetailModel)
}

// View -> Presenter
protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    
    func viewDidLoad()
    
    //   for  tableView
    func numsOfSection() -> Int
    func numsOfRows(section: Int) -> Int
    func configTableCell(section: Int) -> (data: [ContentObject], delegate: CollectionViewToPresenter?)
    func filterDataUsingGenre(index: Int)
    func setupSectionHeaderView(section: Int) -> String
    func tappedOnMoviePoster() 
}

// Interactor -> Presenter
protocol HomeInteractorToPresenterProtocol: AnyObject {

    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, HomePresenterError>)
    func onFetchMovie(forUse: ForUse, responce: Result<DetailModel, HomePresenterError>)
    func onFetchGenre(responce: Result<GenreList, HomePresenterError>)
}
