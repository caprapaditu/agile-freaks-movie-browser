//
//  CustomNavigationBar.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 28.01.2025.
//

import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    @Binding var hasNewNotifications: Bool
    var onMenuButtonTapped: () -> Void
    var onNotificationButtonTapped: () -> Void

    var body: some View {
        HStack {
            Button {
                onMenuButtonTapped()
            } label: {
                Image(ImageResource.menuIcon)
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            Spacer()

            Text(title)
                .font(.appFont(.merriweatherBold, size: Constants.fontSizeTitle))
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            ZStack(alignment: .topTrailing) {
                Button(action: {
                    onNotificationButtonTapped()
                }) {
                    Image(ImageResource.bellIcon)
                        .font(.title2)
                        .foregroundColor(.primary)
                }

                if hasNewNotifications {
                    Circle()
                        .fill(Color.red)
                        .frame(width: Constants.notificationDotCircleSize, height: Constants.notificationDotCircleSize)
                        .offset(x: Constants.xOffSetNotificationCircle, y: Constants.yOffSetNotificationCircle)
                }
            }
        }
        .padding(.horizontal)
        .frame(height: Constants.heightNavigationBar)
    }
}

extension CustomNavigationBar {
    private enum Constants {
        static let fontSizeTitle = 16.0
        static let notificationDotCircleSize = 10.0
        static let xOffSetNotificationCircle = 0.0
        static let yOffSetNotificationCircle = -3.0
        static let heightNavigationBar = 60.0
    }
}
