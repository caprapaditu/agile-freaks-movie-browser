//
//  MovieInfoView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieInfoView: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.appFont(.mulishLight, size: 12))
                .foregroundColor(.greyCustom)
            Text(value)
                .font(.appFont(.mulishRegular, size: 12))
                .foregroundColor(.blackCustom)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}
