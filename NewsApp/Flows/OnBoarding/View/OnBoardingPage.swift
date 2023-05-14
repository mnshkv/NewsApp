//
//  OnBoardingPage.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 12.05.2023.
//
import UIKit

struct OnBoardingPage {
    let cardName: String
    let title: String
    let subtitle: String

    static let about: Self = .init(
        cardName: "firstCard",
        title: "Watch your favorite movie easily",
        subtitle: "Popular movies from all over the world in your app."
    )

    static let favourites: Self = .init(
        cardName: "secondCard",
        title: "Save your favorite movies in your app",
        subtitle: "You can create a selection of your favorite movies!"
    )

    static let genres: Self = .init(
        cardName: "thirdCard",
        title: "Choose your favorite genres",
        subtitle: "Do you prefer a certain genre? Choose your favorite and enjoy watching!"

    )

    static let all: [Self] = [.about, .favourites, .genres]
}
