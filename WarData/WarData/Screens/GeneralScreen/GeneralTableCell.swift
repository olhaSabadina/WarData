//
//  GeneralTableCell.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class GeneralTableCell: UITableViewCell {
    
    static let cellID = "GeneralTableCell"
    
    let labelCell = UILabel()
    let nameEquipmentLabel = UILabel()
    let numberOfLossesLabel = UILabel()
    let imageEquipmentImageView = UIImageView()
    var stack = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        labelCell.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLabel()
        setStackLables()
        setStackImage()
        setStackView()
        setConstreints()
    }
    
    override func prepareForReuse() {
        backgroundColor = nil
    }
    
    func setLabel() {
        addSubview(labelCell)
    }
    
    func setStackView() {
        stack = UIStackView(arrangedSubviews: [nameEquipmentLabel, imageEquipmentImageView, numberOfLossesLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
    }
    
    func setStackLables() {
        nameEquipmentLabel.textAlignment = .right
        nameEquipmentLabel.font = .boldSystemFont(ofSize: 20)
        nameEquipmentLabel.text = "tank"
        
        numberOfLossesLabel.textAlignment = .left
        numberOfLossesLabel.font = .boldSystemFont(ofSize: 18)
        numberOfLossesLabel.text = "10"
    }
    
    func setStackImage() {
//        imageEquipmentImageView.image =
        imageEquipmentImageView.backgroundColor = .red
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageEquipmentImageView.heightAnchor.constraint(equalTo: stack.heightAnchor),
            imageEquipmentImageView.widthAnchor.constraint(equalTo: imageEquipmentImageView.heightAnchor),
            imageEquipmentImageView.centerXAnchor.constraint(equalTo: stack.centerXAnchor)
        ])
    }

}
