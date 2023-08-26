//
//  DetailVC+Collection.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

extension DetailViewController {
    
    func setCollectionView() {
        detailCollection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        detailCollection?.delegate = self
        detailCollection?.dataSource = self
        detailCollection?.backgroundColor = .clear
        detailCollection?.translatesAutoresizingMaskIntoConstraints = false
        
        detailCollection?.register(DetailCollectionCell.self, forCellWithReuseIdentifier: DetailCollectionCell.identCell)
        
        view.addSubview(detailCollection ?? UICollectionView())
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, leyoutEnvironment)-> NSCollectionLayoutSection? in
                return self.createDetailSection()
            }
        return layout
    }
    
    private func createDetailSection() -> NSCollectionLayoutSection {
        
        let item = CompositionalLayout.createItem(width: .fractionalWidth(1.0), height: .fractionalHeight(1.0), spacing: 5)
        
        let groupHeight = UIScreen.main.bounds.height/1.45
//        let groupWidth = groupHeight/1.6
        
        let group = CompositionalLayout.createGroupeCount(aligment: .horizontal, width: .fractionalWidth(0.89), height: .absolute(groupHeight), item: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 16)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    
    
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.identCell, for: indexPath) as? DetailCollectionCell else {return UICollectionViewCell()}
        
        return cell
    }
    
    
}
