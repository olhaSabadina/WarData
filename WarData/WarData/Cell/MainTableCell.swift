//
//  GeneralTableCell.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    static let cellID = "MainTableCell"
    
    var rowData: RowData? {
        didSet{
            configureCell()
        }
    }
    private let nameEquipmentLabel = UILabel()
    private let numberOfLossesLabel = UILabel()
    private let equipmentImageView = UIImageView()
    private var stack = UIStackView()
    
//MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackLables()
        setStackImage()
        setStackView()
        setConstreints()
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - private function:
    
   private func setStackView() {
        stack = UIStackView(arrangedSubviews: [nameEquipmentLabel, equipmentImageView, numberOfLossesLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    }
    
    private func setStackLables() {
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
        numberOfLossesLabel.font = UIFont.digiFont(ofSize: 30)
    }
    
    private func configureCell() {
        nameEquipmentLabel.text = rowData?.title
        numberOfLossesLabel.text = rowData?.value
        equipmentImageView.image = UIImage(named: rowData?.image ?? "no-photo")
    }
    
    private func setStackImage() {
        equipmentImageView.contentMode = .scaleAspectFit
        equipmentImageView.backgroundColor = .gray.withAlphaComponent(0.3)
    }
    
    private func setConstreints() {
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            equipmentImageView.widthAnchor.constraint(equalTo: equipmentImageView.heightAnchor),
            equipmentImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
