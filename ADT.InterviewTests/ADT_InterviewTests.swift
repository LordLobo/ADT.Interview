//
//  ADT_InterviewTests.swift
//  ADT.InterviewTests
//
//  Created by Dan Giralte on 9/15/20.
//  Copyright © 2020 Dan Giralte. All rights reserved.
//

import XCTest
@testable import ADT_Interview

class ADT_InterviewTests: XCTestCase {
    // this was some practice to set up my environment
    func testFizzBuzz__given_3__has_Fizz_at_element_2() {
        // given
        let iterations = 3
        
        // when
        let sut = SubjectForTests.fizzBuzz(upTo: iterations)
        
        //then
        XCTAssert(sut[2] == "Fizz")
    }
    
    func testFizzBuzz__given_5__has_Buzz_at_element_4() {
        // given
        let iterations = 5
        
        // when
        let sut = SubjectForTests.fizzBuzz(upTo: iterations)
        
        //then
        XCTAssert(sut[4] == "Buzz")
    }

}
