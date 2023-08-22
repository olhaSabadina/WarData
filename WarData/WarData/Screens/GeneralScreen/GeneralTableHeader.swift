//
//  GeneralTableHeader.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class GeneralTableHeader: UITableViewHeaderFooterView {
    
    static let headerID = "GeneralTableHeader"
    
    let dateLabel = UILabel()
    let dayLabel = UILabel()
    var stack = UIStackView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStackView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStackView() {
        stack = UIStackView(arrangedSubviews: [dateLabel, dayLabel])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fill
        setLabels(dayLabel)
        setLabels(dateLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
    }
    
    func setLabels(_ labels: UILabel) {
        labels.font = .boldSystemFont(ofSize: 25)
        labels.textAlignment = .center
        labels.text = "day"
    }

    func setConstraint() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

    }
}
