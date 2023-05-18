//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//


import UIKit
import SnapKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private let categories = [String]()

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setDelegates()
        configureCollectionView()
    }

    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }

    private func configureCollectionView() {
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        collectionView.collectionViewLayout = createLayout()
    }
}

//MARK: - Create layout
extension CategoriesViewController {
    private func createLayout() -> UICollectionViewLayout {
           let spacing: CGFloat = 16
           let itemSize = NSCollectionLayoutSize(
               widthDimension: .fractionalWidth(1.0),
               heightDimension: .fractionalHeight(1.0))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)

           let groupSize = NSCollectionLayoutSize(
               widthDimension: .fractionalWidth(1.0),
               heightDimension: .absolute(72))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) // <---
           group.interItemSpacing = .fixed(spacing)

           let section = NSCollectionLayoutSection(group: group)
           section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
           section.interGroupSpacing = spacing

           let layout = UICollectionViewCompositionalLayout(section: section)
           return layout
       }

}

//MARK: - Data source methods
extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        67
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        return cell
    }

    //создать кастомный header UICollectionReusableView
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
//        return header
//    }
}
