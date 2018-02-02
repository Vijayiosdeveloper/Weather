//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Vijay Thota on 2/1/18.
//  Copyright © 2018 Test. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    
    var jerseyCityModule: WeatherInfo?
    var edisonModule: WeatherInfo?
    var dummyModule: WeatherInfo?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        do {
            
            // Loading the JSON files into the modules
            var testBundle = Bundle(for: type(of: self))
            var fileLocation = testBundle.url(forResource: "JerseyCity", withExtension: "json")
            var jsonData = try Data(contentsOf: fileLocation!, options: .mappedIfSafe)
            var jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as! [String: Any]
            jerseyCityModule = WeatherInfo(json: jsonDict)!
            
            testBundle = Bundle(for: type(of: self))
            fileLocation = testBundle.url(forResource: "Edison", withExtension: "json")
            jsonData = try Data(contentsOf: fileLocation!, options: .mappedIfSafe)
            jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as! [String: Any]
            edisonModule = WeatherInfo(json: jsonDict)!
            
            testBundle = Bundle(for: type(of: self))
            fileLocation = testBundle.url(forResource: "Dummy", withExtension: "json")
            jsonData = try Data(contentsOf: fileLocation!, options: .mappedIfSafe)
            jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as! [String: Any]
            dummyModule = WeatherInfo(json: jsonDict)
        }
        catch {
            
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        jerseyCityModule = nil
        edisonModule = nil
        dummyModule = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Positive Test Case
        XCTAssertTrue(jerseyCityModule?.name == "Jersey City")
        
        // Negative Test Case
        XCTAssertTrue(edisonModule?.name != "Jersey City")
        
        // Positive Test Case
        XCTAssertTrue(edisonModule?.name == "Edison")
        
        // Positive Test Case
        XCTAssertTrue(dummyModule?.name == nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
