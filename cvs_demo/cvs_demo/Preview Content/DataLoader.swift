//
//  DataLoader.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import Foundation

struct DataLoader {
  static func loadSampleData() -> FlickrResponse {
    
    for bundle in Bundle.allBundles {
      if let url = bundle.url(forResource: "SampleData", withExtension: "json") {
        do {
          let data = try Data(contentsOf: url)
          let response = try JSONDecoder().decode(FlickrResponse.self, from: data)
          return response
        } catch {
          fatalError("Failed to decode SampleData.json: \(error)")
        }
      }
    }
    fatalError("SampleRecipes.json not found in any bundle.")
  }
}

