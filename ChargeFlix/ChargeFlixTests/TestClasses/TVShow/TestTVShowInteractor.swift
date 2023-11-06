//
//  TestTVShowInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestTVShowInteractor: XCTestCase {

    var repository: MockRepository = MockRepository()
    var interactor: TVShowMockInteractor?
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = TVShowMockInteractor(repository: repository)
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        super.tearDown()
    }

    func test_getTVShows_Success() {
        interactor?.getTVShows(type: .popularTVShows, page: 1)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_getTVShows_Failure() {
        interactor?.getTVShows(type: .tvShowDetail, page: 1)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }
    
    func test_getTVShowDetail_Success() {
        interactor?.getTVShowById(type: .tvShowDetail, id: 1)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_getTVShowDetail_Failure() {
        interactor?.getTVShowById(type: .topRatedTVShows, id: 1)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }

}
