//
//  TestMovie.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 07/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestMovie: XCTestCase {
    
    private var repository = MockRepository()
    private var router: MovieRouter = MovieRouter()
    private var presenter: MoviePresenter?
    private var interactor: MovieInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = MovieInteractor(repository: repository)
        presenter = MoviePresenter(router: router, interactor: interactor)
        interactor?.presenter = presenter
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        presenter = nil
        super.tearDown()
    }
    
    //    /    Fetch MoviesList
    func test_MoviesListFetch_Success() {
        presenter?.interactor?.getMovies(type: .popularMovies, page: 1)
        
        XCTAssertNotNil(presenter?.populerMovieList)
        XCTAssertNil(presenter?.error)
    }
    
    func test_MovieListFetch_Failure() {
        presenter?.interactor?.getMovies(type: .movieDetail, page: 1)
        
        XCTAssertTrue(((presenter?.populerMovieList.isEmpty) != nil))
        XCTAssertNotNil(presenter?.error)
        XCTAssert(presenter?.error == .failedInPopularMovies)
    }
    
    // Fetch Movie Detail for header setup
    
    func test_MovieDetailFetch_Success() {
        presenter?.interactor?.getMovieDetail(type: .movieDetail, id: 1)
        
        
        XCTAssertNotNil(presenter?.movieDetail)
        XCTAssertNil(presenter?.error)
    }
    
    func test_MovieDetailFetch_Failure() {
        presenter?.interactor?.getMovieDetail(type: .castDetail, id: 0)
        
        XCTAssertNil(presenter?.movieDetail)
        XCTAssertNotNil(presenter?.error)
    }
    
    
}
