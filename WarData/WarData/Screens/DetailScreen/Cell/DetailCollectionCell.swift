//
//  DetailCollectionCell.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
    
    static var identCell = "DetailCollectionCell"
   
    let imageView = UIImageView()
    let modelLabel = UILabel()
    let nameEquipment = UILabel()
    var equipmentFilterData: EquipmentFilterData? {
        didSet {
            setValueForCell()
        }
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureCell()
        setImage()
        setModelLabel()
        setConstreints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setValueForCell() {
        //TODO: set image
        imageView.image = UIImage(named: equipmentFilterData?.nameEquipment ?? "questionmark.app")
        modelLabel.text = equipmentFilterData?.model
        nameEquipment.text = equipmentFilterData?.nameEquipment
    }
    
    private func configureCell() {
        self.cornerRadius(radius: 10, backColor: .gray.withAlphaComponent(0.5))
    }
    
    func setImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "airplane")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
    
    func setModelLabel() {
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.font = .boldSystemFont(ofSize: 17)
        modelLabel.textAlignment = .center
        modelLabel.numberOfLines = 3
        modelLabel.textColor = .yellow
        modelLabel.adjustsFontSizeToFitWidth = true
        addSubview(modelLabel)
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: modelLabel.topAnchor, constant: -20),
            
            modelLabel.heightAnchor.constraint(equalToConstant: 45),
            modelLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            modelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            modelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}

