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
        title: "First to know",
        subtitle: "All news in one place, be the first to know last news."
    )

    static let favourites: Self = .init(
        cardName: "secondCard",
        title: "Second to know",
        subtitle: "All news in one place, be the first to know last news."
    )

    static let genres: Self = .init(
        cardName: "thirdCard",
        title: "Third to know",
        subtitle: "All news in one place, be the first to know last news."
    )

    static let all: [Self] = [.about, .favourites, .genres]
}
