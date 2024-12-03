//
//  FlickrResponse.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import Foundation

struct FlickrResponse: Decodable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [FlickrPhoto]
}
