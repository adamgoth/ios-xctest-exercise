//
//  xctest_exerciseTests.swift
//  xctest-exerciseTests
//
//  Created by Adam Goth on 9/15/16.
//  Copyright © 2016 Adam Goth. All rights reserved.
//

import XCTest
@testable import xctest_exercise

class xctest_exerciseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18440, "allWords was not 18440")
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "took"), 76, "took does not appear 76 times")
    }
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    func testUserFilterWorks() {
        let playData = PlayData()
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495)
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55)
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1)
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56)
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7)
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0)
    }
}
