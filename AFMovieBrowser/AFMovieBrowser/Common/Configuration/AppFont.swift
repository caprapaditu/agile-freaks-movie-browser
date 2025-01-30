//
//  AppFont.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

enum AppFont: String {
    case merriweatherRegular = "Merriweather-Regular"
    case merriweatherBold = "Merriweather-Bold"
    case merriweatherUltraBold = "Merriweather-UltraBold"
    case mulishRegular = "Mulish-Regular"
    case mulishLight = "Mulish-Light"
    case mulishBold = "Mulish-Bold"
}

extension Font {
    static func appFont(_ font: AppFont, size: CGFloat) -> Font {
        return .custom(font.rawValue, size: size)
    }
}
