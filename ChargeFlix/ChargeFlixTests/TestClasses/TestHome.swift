//
//  TestHome.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 07/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestHome: XCTestCase {
    
    var repository = MockRepository()
    var router = HomeRouter()
    var interactor: HomeInteractor?
    var presenter: HomePresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = HomeInteractor(repository: repository)
        presenter = HomePresenter(router: router, interactor: interactor)
        interactor?.presenter = presenter
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        presenter = nil
        super.tearDown()
    }

//    Fetch MoviesList
    func test_MoviesListFetch_Success() {
        presenter?.interactor?.getMovies(type: .popularMovies, page: 1)
        
        XCTAssertNotNil(presenter?.moviesDetails)
        XCTAssertNil(presenter?.error)
    }
    
    func test_MovieListFetch_Failure() {
        presenter?.interactor?.getMovies(type: .movieDetail, page: 1)
        
        XCTAssertTrue(((presenter?.moviesDetails.keys.isEmpty) != nil))
        XCTAssertNotNil(presenter?.error)
        XCTAssert(presenter?.error == .failedToFetchMoviesList)
    }
    
// Fetch Movie Detail for header setup
    
    func test_MovieDetailFetch_ForRandomMovie_Success() {
        presenter?.interactor?.getMovie(forUse: .setupHeader, type: .movieDetail, id: 1)
        
        XCTAssertNotNil(presenter?.randomMovie)
        XCTAssertNil(presenter?.error)
    }
    
    func test_MovieDetailFetch_ForRandomMovie_Failure() {
        presenter?.interactor?.getMovie(forUse: .pushToDetail, type: .movieDetail, id: 1)
        
        XCTAssertNil(presenter?.randomMovie)
        XCTAssertNotNil(presenter?.movieDetail)
    }
    
// Fetch Movie Detail For PushTo Detail
    
    func test_MovieDetailFetch_ForPushToDetail_Success() {
        presenter?.interactor?.getMovie(forUse: .pushToDetail, type: .movieDetail, id: 1)
        
        XCTAssertNotNil(presenter?.movieDetail)
        XCTAssertNil(presenter?.error)
       
        
    }
    

    func test_MovieDetailFetch_ForPushToDetail_Failure() {
        presenter?.interactor?.getMovie(forUse: .setupHeader, type: .movieDetail, id: 1)
        
        XCTAssertNil(presenter?.movieDetail)
        XCTAssertNotNil(presenter?.randomMovie)
        
    }
    
// Fetch Movie Fail
    
    func test_FetchMovie_Failure() {
        presenter?.interactor?.getMovie(forUse: .setupHeader, type: .popularMovies, id: 1)
        XCTAssertNil(presenter?.randomMovie)
        XCTAssertNil(presenter?.movieDetail)
        XCTAssertTrue(presenter?.error == .failedToFetchMovieDetail)
      
    }
// Fetch MoviegenreList
    func test_MovieGenreFetch_ForPushToDetail_Success() {
        presenter?.interactor?.getGenreList(type: .movieGenreList)
        
        XCTAssertNotNil(presenter?.movieGenreList)
        XCTAssertNil(presenter?.error)
    }
    
    func test_MovieGenreFetch_Failure() {
        presenter?.interactor?.getGenreList(type: .castMovieCredit)
        
        XCTAssertNil(presenter?.movieGenreList)
        XCTAssertNotNil(presenter?.error)
        XCTAssert(presenter?.error == .failedToFetchGenreList)
    }

}
