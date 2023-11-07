//
//  TestTVShow.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 07/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestTVShow: XCTestCase {

    private var repository = MockRepository()
    private var router: TVShowRouter = TVShowRouter()
    private var presenter: TVShowPresenter?
    private var interactor: TVShowInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = TVShowInteractor(repository: repository)
        presenter = TVShowPresenter(router: router, interactor: interactor)
        interactor?.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        presenter = nil
        super.tearDown()
    }

    func test_getTVShowsList_Success() {
        presenter?.interactor?.getTVShows(type: .popularTVShows, page: 1)
        
        XCTAssertNotNil(presenter?.tvShowsList)
        XCTAssertNil(presenter?.error)
    }
    
    func test_getTVShowsList_Failure() {
        presenter?.interactor?.getTVShows(type: .movieDetail, page: 1)
        
        XCTAssertNil(presenter?.tvShowsList)
        XCTAssertNotNil(presenter?.error)
    }
    
    func test_getTVShowDetail_Success() {
        presenter?.interactor?.getTVShowById(type: .tvShowDetail, id: 1)
        
        XCTAssertNotNil(presenter?.tvshowDetail)
        XCTAssertNil(presenter?.error)
    }
    
    func test_getTVShowDetail_Failure() {
        presenter?.interactor?.getTVShowById(type: .movieGenreList, id: 1)
        
        XCTAssertNil(presenter?.tvshowDetail)
        XCTAssertNotNil(presenter?.error)
    }

}
