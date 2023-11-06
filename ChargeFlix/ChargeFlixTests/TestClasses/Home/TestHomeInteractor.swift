//
//  TestHomeInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestHomeInteractor: XCTestCase {
    let repository = MockRepository()
    var interactor: HomeMockInteractor?
    override func setUp() {
        super.setUp()
        interactor = HomeMockInteractor(repository: repository)
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func test_getMovies_Success() {
        interactor?.getMovies(type: .popularMovies, page: 1)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_getMovies_Failure() {
        interactor?.getMovies(type: .movieDetail, page: 1)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }
    
    func test_movieDetail_Success() {
        interactor?.getMovie(forUse: .setupHeader, type: .movieDetail, id: 0)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_movieDetail_Failure() {
        interactor?.getMovie(forUse: .setupHeader, type: .popularTVShows, id: 0)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }
    
    func test_movieGenre_Success() {
        interactor?.getGenreList(type: .movieGenreList)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_movieGenre_Failure() {
        interactor?.getGenreList(type: .castDetail)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }

}
