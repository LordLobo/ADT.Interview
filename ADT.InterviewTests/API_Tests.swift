//
//  API_Tests.swift
//  ADT.InterviewTests
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import XCTest
@testable import ADT_Interview

class API_Tests: XCTestCase {
    
    func testGetEpisodes__returns_more_than_zero_record_count() {
        // Given
        let sut = API()
        let expectation = XCTestExpectation(description: "Done")
        var response : EpisodeResults?
        
        // When
        sut.getEpisodes() { result in
            response = result
            expectation.fulfill()
        }
        
        let waitResult = XCTWaiter.wait(for: [expectation], timeout: 30)

        // Then
        XCTAssert(waitResult == .completed, "Wait did not complete.")
        XCTAssertNotNil(response, "Response empty.")
        XCTAssert(response!.info.count > 0, "Count zero or less")
    }

}
