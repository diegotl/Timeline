//
//  DateTests.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import XCTest
@testable import Timeline

class DateTests: XCTestCase {

    func test_is_same_day_as() {
        XCTAssertTrue(Date().isSameDayAs(Date()))
        XCTAssertTrue("2020-03-15T09:00:00+00:00".date!.isSameDayAs("2020-03-15T08:00:00+00:00".date!))
        XCTAssertFalse("2019-03-15T09:00:00+00:00".date!.isSameDayAs("2020-03-15T08:00:00+00:00".date!))
    }

}
