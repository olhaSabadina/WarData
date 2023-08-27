//
//  HumanCollectionCell.swift
//  WarData
//
//  Created by Olga Sabadina on 25.08.2023.
//

import UIKit

class HumanCollectionCell: UICollectionViewCell {
   
    static var identCell = "HumanCollectionCell"
    
    private let imageView = UIImageView()
    private let dayLabel = UILabel()
    private let valueLabel = UILabel()
    private let dailyLoss = UILabel()
    private var stack = UIStackView()
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
    
    private func setValueForCell() {
        guard let itemData = itemData else {return}
        imageView.image = UIImage(named: itemData.image)
        dayLabel.attributedText = "день \(itemData.day)".setAttributeForSymbols(20, count: 5)
        valueLabel.attributedText = itemData.value.setAttributeForSymbols(23,count: 10)
        dailyLoss.text = "+ \(itemData.dailyLoss)"
    }
    
    private func configureCell() {
        self.cornerRadius(radius: 25, backColor: .gray.withAlphaComponent(0.5))
        configImageView()
        setDayLabel()
        setValueLabel()
        setStack()
    }
    
    private func setStack() {
        stack = UIStackView(arrangedSubviews: [valueLabel,dailyLoss, dayLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    private func setDayLabel() {
        dayLabel.font = UIFont(name: "DS-Digital-Bold", size: 26)
        dayLabel.textAlignment = .center
        dayLabel.textColor = .white
    }
    
    private func setValueLabel() {
        dailyLoss.font = .systemFont(ofSize: 16)
        dailyLoss.textColor = .white
        dailyLoss.textAlignment = .center
        
        valueLabel.font = UIFont(name: "DS-Digital-Bold", size: 47)
        valueLabel.textAlignment = .center
        valueLabel.textColor = .yellow
        valueLabel.numberOfLines = 0
    }
    
    private func configImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.addShadow(cornerRadius: 10, offset: .init(width: 5, height: 8), color: .black, radius: 7, opacity: 1)
    }
        
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            imageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}
