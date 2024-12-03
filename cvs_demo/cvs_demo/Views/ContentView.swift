//
//  ContentView.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlickrViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Searching...")
                } else {
                    PhotoGridView(photos: viewModel.photos)
                }
            }
            .navigationTitle("Flickr Search")
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer, prompt: "Search Photos")
        .onChange(of: viewModel.searchText) {
            Task {
                await viewModel.searchPhotos()
            }
        }
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil), actions: {
            Button("OK", role: .cancel) {}
        }, message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        })
    }
}

#Preview {
    ContentView()
}
