//
//  HumanVC+Collection.swift
//  WarData
//
//  Created by Olga Sabadina on 25.08.2023.
//

import UIKit

extension HumanViewController {
    
    func setCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView?.register(HumanCollectionCell.self, forCellWithReuseIdentifier: HumanCollectionCell.identCell)
        
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, leyoutEnvironment)-> NSCollectionLayoutSection? in
                return self.createHumanSection()
            }
        return layout
    }
    
    private func createHumanSection() -> NSCollectionLayoutSection {
        
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

//  MARK: - CollectionViewDataSours:

extension HumanViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HumanCollectionCell.identCell, for: indexPath) as? HumanCollectionCell else {return UICollectionViewCell()}
        cell.itemData = itemsData[indexPath.item]
        return cell
    }
    
}

//  MARK: - CollectionViewDelegate:

extension HumanViewController: UICollectionViewDelegate {
    
}
