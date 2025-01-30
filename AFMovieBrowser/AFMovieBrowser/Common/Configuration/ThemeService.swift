//
//  ThemeService.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import UIKit

class ThemeService {
    static let shared = ThemeService()

    func start() {
        configureTabView()
    }

    func configureTabView() {
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
            colors: [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.1).cgColor
            ]
        )

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6

        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image

        UITabBar.appearance().standardAppearance = appearance
    }
}
