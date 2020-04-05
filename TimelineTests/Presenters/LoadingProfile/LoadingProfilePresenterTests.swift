//
//  LoadingProfilePresenterTests.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import XCTest
@testable import Timeline

class LoadingProfilePresenterTests: XCTestCase {
    
    var viewSpy: LoadingProfileViewSpy!
    var useCaseFactory = TestUseCaseFactory()
    var routerFactory = TestRouterFactory()
    
    override func setUp() {
        viewSpy = LoadingProfileViewSpy()
    }

    func test_load_empty_profiles() {
        useCaseFactory.listProfilesUseCase = ListProfilesUseCaseStub(resultToBeReturned: .success([]))
        
        let routerSpy = TimelineViewRouterSpy()
        routerFactory.timelineViewRouter = routerSpy
        
        let presenter = LoadingProfilePresenter(view: viewSpy, useCaseFactory: useCaseFactory, routerFactory: routerFactory)
        presenter.loadProfile()
        
        XCTAssertEqual(viewSpy.status, "No profiles found")
        XCTAssertFalse(viewSpy.retryButtonShown)
        XCTAssertFalse(routerSpy.didCallNavigateTo)
    }
    
    func test_load_error() {
        enum TestError: LocalizedError {
            case testableError
            
            public var errorDescription: String? {
                return "Custom error message"
            }
        }
            
        useCaseFactory.listProfilesUseCase = ListProfilesUseCaseStub(resultToBeReturned: .failure(TestError.testableError))
        
        let routerSpy = TimelineViewRouterSpy()
        routerFactory.timelineViewRouter = routerSpy
        
        let presenter = LoadingProfilePresenter(view: viewSpy, useCaseFactory: useCaseFactory, routerFactory: routerFactory)
        presenter.loadProfile()
        
        XCTAssertEqual(viewSpy.status, "Custom error message")
        XCTAssertTrue(viewSpy.retryButtonShown)
        XCTAssertFalse(routerSpy.didCallNavigateTo)
    }
    
    func test_load_success() {
        let profiles = [Profile(id: "first_profile"), Profile(id: "second_profile")]
        useCaseFactory.listProfilesUseCase = ListProfilesUseCaseStub(resultToBeReturned: .success(profiles))
        
        let routerSpy = TimelineViewRouterSpy()
        routerFactory.timelineViewRouter = routerSpy
        
        let presenter = LoadingProfilePresenter(view: viewSpy, useCaseFactory: useCaseFactory, routerFactory: routerFactory)
        presenter.loadProfile()
        
        let expectation = XCTestExpectation(description: "test")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            XCTAssertEqual(self.viewSpy.status, "Found profile: first_profile")
            XCTAssertFalse(self.viewSpy.retryButtonShown)
            XCTAssertTrue(routerSpy.didCallNavigateTo)
            XCTAssertEqual(routerSpy.profile?.id, profiles.first?.id)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }

}
