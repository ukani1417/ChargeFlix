//
//  TestMockMovieInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestMovieInteractor: XCTestCase {
    let repository = MockRepository()
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_getMovies_Success() {
        let interactor = MovieMockInteractor(repository: repository)
        
        interactor.getMovies(type: .popularMovies, page: 1)
        
        XCTAssertNotNil(interactor.data)
        XCTAssertNil(interactor.error)
    }
    
    func test_getMovies_Failure() {
        let interactor = MovieMockInteractor(repository: repository)
        
        interactor.getMovies(type: .movieDetail, page: 1)
        
        XCTAssertNil(interactor.data)
        XCTAssertNotNil(interactor.error)
    }
    
    func test_movieDetail_Success() {
        let interactor = MovieMockInteractor(repository: repository)
        
        interactor.getMovieDetail(type: .movieDetail, id: 1)
        
        XCTAssertNotNil(interactor.data)
        XCTAssertNil(interactor.error)
    }
    
    func test_movieDetail_Failure() {
        let interactor = MovieMockInteractor(repository: repository)
        
        interactor.getMovieDetail(type: .castDetail, id: 1)
        
        XCTAssertNil(interactor.data)
        XCTAssertNotNil(interactor.error)
    }
    

}
