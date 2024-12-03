//
//  FlickrService.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import Foundation

protocol FlickrServiceProtocol {
    func fetchPhotos(for tags: String) async throws -> [FlickrPhoto]
}

class FlickrService: FlickrServiceProtocol {
    func fetchPhotos(for tags: String) async throws -> [FlickrPhoto] {
        let formattedTags = tags.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = Constants.API.flickrUrl + "\(formattedTags)"
                
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(FlickrResponse.self, from: data)
        return response.items
    }
}

