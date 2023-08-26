//
//  GeneralTableCell.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    static let cellID = "MainTableCell"
    
    let nameEquipmentLabel = UILabel()
    let numberOfLossesLabel = UILabel()
    let imageEquipmentImageView = UIImageView()
    var stack = UIStackView()
    var rowData: RowData? {
        didSet{
            configureCell()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackLables()
        setStackImage()
        setStackView()
        setConstreints()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setStackView() {
        stack = UIStackView(arrangedSubviews: [nameEquipmentLabel, imageEquipmentImageView, numberOfLossesLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    func setStackLables() {
        nameEquipmentLabel.textAlignment = .right
        nameEquipmentLabel.numberOfLines = 2
        nameEquipmentLabel.adjustsFontSizeToFitWidth = true
        nameEquipmentLabel.font = .boldSystemFont(ofSize: 18)
        nameEquipmentLabel.shadowOffset = .init(width: 0.5, height: 0.8)
        nameEquipmentLabel.shadowColor = .systemYellow
        nameEquipmentLabel.textColor = .systemOrange
        
        numberOfLossesLabel.adjustsFontSizeToFitWidth = true
        numberOfLossesLabel.textAlignment = .left
        numberOfLossesLabel.textColor = .systemYellow
        numberOfLossesLabel.font = UIFont(name: "DS-Digital-Bold", size: 30)
    }
    
    func configureCell() {
        nameEquipmentLabel.text = rowData?.title
        numberOfLossesLabel.text = rowData?.value
    }
    
    func setStackImage() {
        imageEquipmentImageView.backgroundColor = .red
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageEquipmentImageView.widthAnchor.constraint(equalTo: imageEquipmentImageView.heightAnchor),
            imageEquipmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
