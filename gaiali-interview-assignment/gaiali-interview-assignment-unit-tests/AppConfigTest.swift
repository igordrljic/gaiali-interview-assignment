//
//  gaiali_interview_assignment_unit_tests.swift
//  gaiali-interview-assignment-unit-tests
//
//  Created by Igor Drljic on 26.11.21..
//

import XCTest
@testable import gaiali_interview_assignment

class AppConfigTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppConfigRead() throws {
        for environment in Environment.allCases {
            _ = AppConfig.read(for: environment)
        }
    }
}
