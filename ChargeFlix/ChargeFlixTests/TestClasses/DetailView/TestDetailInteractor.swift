//
//  TestDetailInteractor.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import XCTest
@testable import ChargeFlix

final class TestDetailInteractor: XCTestCase {
    
    var repository: MockRepository = MockRepository()
    var interactor: DetailMockInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        interactor = DetailMockInteractor(repository: repository)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        super.tearDown()
    }

    func test_castDetail_Success() {
        interactor?.getCastDetail(type: .castDetail, id: 1)
        
        XCTAssertNotNil(interactor?.data)
        XCTAssertNil(interactor?.error)
    }
    
    func test_castDetail_Failure() {
        interactor?.getCastDetail(type: .movieDetail, id: 1)
        
        XCTAssertNil(interactor?.data)
        XCTAssertNotNil(interactor?.error)
    }

}
