//
//  PhotoDetailView.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import SwiftUI
import asnycImage

struct PhotoDetailView: View {
    let photo: FlickrPhoto

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CAsyncImage(urlString: photo.media.m) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("Title: \(photo.title)")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Text("Description: \(photo.description.htmlToPlainText())")
                    .font(.body)
                    .padding(.bottom, 5)
                
                Text("Author: \(photo.author)")
                    .font(.body)
                    .padding(.bottom, 5)
                
                Text("Published: \(photo.published.formatteddDate())")
                    .font(.body)
                    .padding(.bottom, 5)
            }
            .padding()
        }
    }
}

#Preview {
    PhotoDetailView(photo: DataLoader.loadSampleData().items[0])
}
