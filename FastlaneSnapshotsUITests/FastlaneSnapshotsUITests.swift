//
//  FastlaneSnapshotsUITests.swift
//  FastlaneSnapshotsUITests
//
//  Created by Daisy Ramos on 6/25/21.
//

import XCTest

class FastlaneSnapshotsUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testTakeSnapshots() {
        snapshot("1-GameView")

        let coordinate = app.tables.otherElements.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))

        for _ in 0...5 {
            coordinate.tap()
        }
        snapshot("2-StepperIncremented")
        app.navigationBars.firstMatch.buttons.firstMatch.tap()
        app.textFields.firstMatch.tap()
        snapshot("3-Alert")
        app.textFields.buttons["Clear text"].tapElement()
        app.typeText("Taboo")
        app.buttons["Dismiss"].tap()
        snapshot("4-GameViewChanged")
    }
}

extension XCUIElement {

     /// Removes any current text in the field before typing in the new value
     /// - Parameter text: the text to enter into the field
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        typeText(deleteString)
        typeText(text)
    }

    func tapElement() {
        if isHittable {
            tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
            coordinate.tap()
        }
    }
}
