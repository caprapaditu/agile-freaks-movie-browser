//
//  Int+Extensions.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import Foundation

extension Int {
    var timeFormattedHoursMinutes: String {
        let hours = self / 60
        let minutes = self % 60

        if hours > 0 {
            return "\(hours)h \(minutes)min"
        } else {
            return "\(minutes)min"
        }
    }
}
