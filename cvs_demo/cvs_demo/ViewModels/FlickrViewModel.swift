//
//  FlickrViewModel.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import SwiftUI

@MainActor
class FlickrViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var photos: [FlickrPhoto] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var searchTask: Task<Void, Never>?
    private let flickrService: FlickrServiceProtocol
    
    init(service: FlickrServiceProtocol = FlickrService()) {
        self.flickrService = service
    }
    
    func searchPhotos() async {
        searchTask?.cancel()
        let currentSearchTerm = searchText.trimmingCharacters(in: .whitespaces)
        
        if currentSearchTerm.isEmpty {
            photos = []
            isLoading = false
        }
        else {
            searchTask = Task {
                isLoading = true
                errorMessage = nil
                
                do {
                    photos = try await flickrService.fetchPhotos(for: currentSearchTerm)
                } catch {
                    photos = []
                    if error.localizedDescription != "cancelled" {
                        errorMessage = error.localizedDescription
                    }
                }
                
                if !Task.isCancelled {
                    isLoading = false
                  }
            }
        }
    }
}
