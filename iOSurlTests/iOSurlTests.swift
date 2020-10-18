//
//  iOSurlTests.swift
//  iOSurlTests
//
//  Created by Mike Chirico on 10/16/20.
//

import XCTest
@testable import iOSurl

class iOSurlTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testURLsession() {
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Wait for page")
        
        
        let sess = Session(url: "https://aibot.cwxstat.io/")
        sess.Get(){ result in
            XCTAssertTrue(result.contains("version:"))
            expectation.fulfill()
            
        } onFailure: {
            print("Couldn't download the content")
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
