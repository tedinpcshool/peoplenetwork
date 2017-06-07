//
//  peoplenetworkTests.swift
//  peoplenetworkTests
//
//  Created by ios on 2017/6/5.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import XCTest
@testable import peoplenetwork
class peoplenetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        TEDMainVC1.addTwoNum(a: <#T##Int#>, b: <#T##Int#>)
    (TEDMainVC1()).addThreeNum()
        
        TEDMainVC1.addThreeNum(<#T##TEDMainVC1#>)
        
        
        let vc1=TEDMainVC1()
        vc1.addThreeNum()
        
        let ans=TEDMainVC1.addTwoNum(a: 3, b: 4)
        XCTAssertEqual(ans, 9, "pass")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
