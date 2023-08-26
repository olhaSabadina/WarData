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
        imageView.image = UIImage(named: equipmentFilterData?.nameEquipment ?? "no-photo")
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
        let arrayLabel = [nameEquipment, modelLabel]
        arrayLabel.forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .boldSystemFont(ofSize: 17)
            label.textAlignment = .center
            label.textColor = .yellow
            label.adjustsFontSizeToFitWidth = true
            addSubview(label)
        }
        nameEquipment.numberOfLines = 2
        modelLabel.numberOfLines = 3
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            nameEquipment.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameEquipment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameEquipment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameEquipment.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5),
            
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

