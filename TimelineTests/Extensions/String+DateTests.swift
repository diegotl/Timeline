//
//  String+DateTests.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import XCTest
@testable import Timeline

class String_DateTests: XCTestCase {

    func test_string_to_date() {
        XCTAssertNotNil("2020-03-15T09:00:00+00:00".date)
        XCTAssertNotNil("2020-03-15T08:00:00+00:00".date)
        XCTAssertNotNil("2020-03-01T08:00:00+00:00".date)
        XCTAssertNotNil("2020-02-18T08:00:00+00:00".date)
        
        XCTAssertNil("".date)
        XCTAssertNil("2020-02-18".date)
        XCTAssertNil("A".date)
    }

}
