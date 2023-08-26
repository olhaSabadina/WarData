//
//  DetailCollectionCell.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
    
    static var identCell = "DetailCollectionCell"
    var stack = UIStackView()
    let imageView = UIImageView()
    let modelLabel = UILabel()
    var equipmentFilterData: EquipmentFilterData?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureCell()
        setImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        self.cornerRadius(radius: 25, backColor: .gray.withAlphaComponent(0.5))
        
    }
    
    
    
    func setImage() {
        imageView.image = nil
    }
    
    func setModelLabel() {
        
    }
    
    
    
    
    
    
}

