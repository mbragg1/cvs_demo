//
//  PhotoGridView.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import SwiftUI
import asnycImage

struct PhotoGridView: View {
    var photos: [FlickrPhoto]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(photos) { photo in
                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
                        CAsyncImage(urlString: photo.media.m) { image in
                            image
                                .resizable()
                                .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                        .frame(width: 100, height: 100)
                        .clipped()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PhotoGridView(photos: DataLoader.loadSampleData().items)
}

