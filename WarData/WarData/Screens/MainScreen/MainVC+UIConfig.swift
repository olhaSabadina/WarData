//
//  GeneralVC+UIConfig.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

//MARK: - Set UIConfiguration & constraints:

extension MainViewController {
    
    func configView() {
        setupView()
        setBackgroundImageView()
        setDateLabel()
        setDayLabel()
        setMainTable()
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            dateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            dayLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            mainTable.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 15),
            mainTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
//MARK: - private function
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
     
    private func setBackgroundImageView() {
        backgroundImageView.image = ImageConstants.background
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
    }
    
    private func setDateLabel() {
        dateLabel = PaddingLabel(withInsets: 5, 5, 15, 15)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .boldSystemFont(ofSize: 25)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        view.addSubview(dateLabel)
    }
    
    private func setDayLabel() {
        dayLabel = PaddingLabel(withInsets: 3, 3, 10, 10)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.font = .boldSystemFont(ofSize: 18)
        dayLabel.shadowColor = .lightGray
        dayLabel.shadowOffset = .init(width: 0.4, height: 0.6)
        dayLabel.textAlignment = .center
        dayLabel.textColor = .lightGray
        view.addSubview(dayLabel)
    }
}


