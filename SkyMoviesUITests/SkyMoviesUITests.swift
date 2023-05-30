//
//  SkyMoviesUITests.swift
//  SkyMoviesUITests
//
//  Created by mahesh lad on 22/05/2023.
//

import XCTest
@testable import SkyMovies

final class SkyMoviesUITests: XCTestCase {
   
    var  app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_searchbar_whenEnterBatman_showsList() {
 
        app = XCUIApplication()
        app.launch()

        let moviesNavigationBar = app.navigationBars["Movies"]
        moviesNavigationBar.staticTexts["Movies"].tap()
       
        let searchSearchField = moviesNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        
        XCTAssert(app.keyboards.count > 0, "The keyboard is not shown")
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        bKey.tap()
        aKey.tap()
        tKey.tap()
        mKey.tap()
        aKey.tap()
        nKey.tap()
        
        let searchButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        searchButton.tap()
        
        let batmanStaticText = app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Batman"]/*[[".cells.staticTexts[\"Batman\"]",".staticTexts[\"Batman\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        batmanStaticText.tap()
        
        let cancelButton = moviesNavigationBar.buttons["Cancel"]
        cancelButton.tap()
        
    }
    
    
    func test_searchbar_whenEnterBatman_showsListMock() {
 
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        let moviesNavigationBar = app.navigationBars["Movies"]
        moviesNavigationBar.staticTexts["Movies"].tap()
       
        let searchSearchField = moviesNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        
        XCTAssert(app.keyboards.count > 0, "The keyboard is not shown")
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        
        bKey.tap()
        aKey.tap()
        tKey.tap()
        mKey.tap()
        aKey.tap()
        nKey.tap()
        
        
        let searchButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        searchButton.tap()
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        
        let batmanStaticText = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Batman"]/*[[".cells.staticTexts[\"Batman\"]",".staticTexts[\"Batman\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        batmanStaticText.tap()
        
        let cancelButton = moviesNavigationBar.buttons["Cancel"]
        cancelButton.tap()
        
    }
    
    
    func test_searchField_cancelButton_and_NavigationTitle() {
        app = XCUIApplication()
        app.launch()
        let moviesNavigationBar = app.navigationBars["Movies"]
        let moviesText = moviesNavigationBar.staticTexts["Movies"]
        moviesNavigationBar.staticTexts["Movies"].tap()
        
        let searchSearchField = moviesNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        
        XCTAssertFalse(moviesText.exists)
        
        let cancelButton = moviesNavigationBar.buttons["Cancel"]
        cancelButton.tap()
        
        XCTAssertTrue(moviesText.exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

/*
 
 if keyboard fails to appear in simulator
 uncheck I/O  -   Keyboard -  connect hardware keyboard

 There is a plist with simulator preferences located at ~/Library/Preferences

 To change it to turn off the hardware keyboard, make sure the simulator is off, then run this command:

 defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool no

 You can use xcrun simctl options in a script to shut down simulators.
 */
