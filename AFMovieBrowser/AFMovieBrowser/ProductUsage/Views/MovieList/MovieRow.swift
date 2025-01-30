import SwiftUI

struct MovieRow: View {
    let movie: Movie
    var useVerticalStyle: Bool

    fileprivate func movieDetailView() -> some View {
        return VStack(alignment: .leading, spacing: Constants.ratingSpacing) {
            // Title
            Text(movie.title)
                .font(Constants.titleFont)
                .lineLimit(Constants.lineLimit)

            // Rating
            IMDbRatingView(movie: movie)
        }
    }

    fileprivate func movieExtraDetailView() -> some View {
        return VStack(alignment: .leading, spacing: Constants.standardSpacing) {
            // Genres
            MovieGenresView(movie: movie, customAmountOfGenres: 3)

            // Duration
            if let runtimeMinutes = movie.runtimeMinutes, runtimeMinutes > 0 {
                HStack(spacing: Constants.durationSpacing) {
                    Image(ImageResource.clockIcon)
                        .frame(width: Constants.iconSize, height: Constants.iconSize)

                    Text(runtimeMinutes.timeFormattedHoursMinutes)
                        .font(Constants.durationFont)
                        .foregroundColor(.blackCustom)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
        }
    }

    fileprivate func moviePoster() -> some View {
        return AsyncImage(url: URL(string: movie.posters?.first?.url ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if phase.error != nil {
                Color.red // Error state
            } else {
                ProgressView() // Loading state
            }
        }
        .frame(
            width: useVerticalStyle ? Constants.posterWidth : Constants.posterWidth * 0.7,
            height: useVerticalStyle ? Constants.posterHeight : Constants.posterHeight * 0.7
        )
        .cornerRadius(Constants.posterCornerRadius)
        .shadow(radius: Constants.shadowRadius)
    }

    fileprivate func movieView() -> some View {
        if useVerticalStyle {
            return AnyView(
                VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                    moviePoster()
                    movieDetailView()
                }
            )
        } else {
            return AnyView(
                HStack(alignment: .top, spacing: Constants.horizontalSpacing) {
                    moviePoster()
                    VStack(alignment: .leading, spacing: Constants.standardSpacing) {
                        movieDetailView()
                        movieExtraDetailView()
                    }
                }
            )
        }
    }

    var body: some View {
        movieView()
    }
}

extension MovieRow {
    private enum Constants {
        static let titleFont: Font = .appFont(.mulishBold, size: 14)
        static let posterWidth: CGFloat = 150
        static let posterHeight: CGFloat = 200
        static let posterCornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 4
        static let verticalSpacing: CGFloat = 12
        static let horizontalSpacing: CGFloat = 16
        static let lineLimit: Int = 2
        static let ratingSpacing: CGFloat = 4
        static let standardSpacing: CGFloat = 8.0
        static let durationSpacing: CGFloat = 4
        static let iconSize: CGFloat = 10
        static let durationFont: Font = .appFont(.mulishRegular, size: 12)
    }
}
