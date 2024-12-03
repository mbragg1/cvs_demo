//
//  StringExtensions.swift
//  cvs_demo
//
//  Created by Mario Bragg on 12/3/24.
//

import Foundation

extension String {
    func htmlToPlainText() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        if let attributedString = try? NSAttributedString(data: data,
            options: [.documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil) {
            return attributedString.string
        }
        return self
    }
    
    func formatteddDate() -> String {
        // Input format from the API
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        // Use local timezone
        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .long
        outputFormatter.timeStyle = .short
        outputFormatter.locale = Locale.current
        
        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        } else {
            return "Invalid date"
        }
    }
}

