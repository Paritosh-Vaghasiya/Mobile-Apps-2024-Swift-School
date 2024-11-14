//
//  Mobile_Apps_2024_Swift_SchoolUITestsLaunchTests.swift
//  Mobile-Apps-2024-Swift-SchoolUITests
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import XCTest

final class Mobile_Apps_2024_Swift_SchoolUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
