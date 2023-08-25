//
//  HumanCollectionCell.swift
//  WarData
//
//  Created by Olga Sabadina on 25.08.2023.
//

import UIKit

class HumanCollectionCell: UICollectionViewCell {
   
    static var identCell = "HumanCollectionCell"
    
    let imageView = UIImageView()
    let dayLabel = UILabel()
    let valueLabel = UILabel()
    var stack = UIStackView()
    var itemData: HumanItemData? {
        didSet {
            setValueForCell()
        }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setValueForCell() {
        guard let itemData = itemData else {return}
        imageView.image = UIImage(named: itemData.image)
        dayLabel.attributedText = "день \(itemData.day)".setAttributeForFirstEightSymbols(20, count: 5)
        valueLabel.attributedText = itemData.value.setAttributeForFirstEightSymbols(23,count: 10)
    }
    
    private func configureCell() {
        self.cornerRadius(radius: 25, backColor: .gray.withAlphaComponent(0.5))
        configImageView()
        setDayLabel()
        setValueLabel()
        setStack()
    }
    
    func setStack() {
        stack = UIStackView(arrangedSubviews: [valueLabel, dayLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    func setDayLabel() {
        dayLabel.font = UIFont(name: "DS-Digital-Bold", size: 26)
        dayLabel.textAlignment = .center
        dayLabel.textColor = .white
    }
    
    func setValueLabel() {
        valueLabel.font = UIFont(name: "DS-Digital-Bold", size: 47)
        valueLabel.textAlignment = .center
        valueLabel.textColor = .yellow
        valueLabel.numberOfLines = 0
    }
    
    private func configImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.borderRadius(radius: 10, layerColor: .black, width: 2)
    }
        
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
}
