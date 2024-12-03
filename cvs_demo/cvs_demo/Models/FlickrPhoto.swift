//
//  FlickrPhoto.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import Foundation

struct FlickrPhoto: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let link: String
    let media: Media
    let date_taken: String
    let description: String
    
    let published: String
    let author: String
    let author_id: String
    let tags: String

    private enum CodingKeys: String, CodingKey {
        case title, link, media, date_taken, description, published, author, author_id, tags
    }
}

struct Media: Decodable {
    let m: String
}

