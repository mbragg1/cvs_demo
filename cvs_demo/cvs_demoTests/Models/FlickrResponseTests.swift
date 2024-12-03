//
//  FlickrResponseTests.swift
//  cvs_demoTests
//
//  Created by Mario Bragg on 12/3/24.
//

import XCTest
@testable import cvs_demo

final class FlickrResponseTests: XCTestCase {

    func testFlickrPhotoDecoding() throws {
        let response = DataLoader.loadSampleData()

        XCTAssertEqual(response.title, "Recent Uploads tagged porcupine")
        XCTAssertEqual(response.link, "https://www.flickr.com/photos/tags/porcupine/")
        XCTAssertEqual(response.description, "")

        XCTAssertEqual(response.modified, "2024-11-30T23:11:50Z")
        XCTAssertEqual(response.generator, "https://www.flickr.com")
        XCTAssertEqual(response.items.count, 2)
    }
}

