//
//  FlickrPhotoTests.swift
//  cvs_demoTests
//
//  Created by Mario Bragg on 12/3/24.
//

import XCTest
@testable import cvs_demo

final class FlickrPhotoTests: XCTestCase {

    func testFlickrPhotoDecoding() throws {
        let photo = DataLoader.loadSampleData().items[0]

        XCTAssertEqual(photo.title, "Look Sharp")
        XCTAssertEqual(photo.link, "https://www.flickr.com/photos/kevin-palmer/54174774469/")
        XCTAssertEqual(photo.date_taken, "2024-11-09T14:25:34-08:00")
        XCTAssertEqual(photo.description, " <p><a href=\"https://www.flickr.com/people/kevin-palmer/\">kevin-palmer</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/kevin-palmer/54174774469/\" title=\"Look Sharp\"><img src=\"https://live.staticflickr.com/65535/54174774469_c2389d4df1_m.jpg\" width=\"240\" height=\"180\" alt=\"Look Sharp\" /></a></p> <p>This porcupine froze in place as I walked by.</p> ")
        XCTAssertEqual(photo.published, "2024-11-30T23:11:50Z")
        XCTAssertEqual(photo.author, "nobody@flickr.com (\"kevin-palmer\")")
        XCTAssertEqual(photo.author_id, "28183637@N08")
        XCTAssertEqual(photo.tags, "november fall autumn sheridan wyoming iphone14pro animal wildlife porcupine wyomingstatetrustland")
    }
    
    func testFlickrMediaDecoding() throws {
        let photo = DataLoader.loadSampleData().items[0]
        let media = photo.media

        XCTAssertEqual(media.m, "https://live.staticflickr.com/65535/54174774469_c2389d4df1_m.jpg")
    }

}

