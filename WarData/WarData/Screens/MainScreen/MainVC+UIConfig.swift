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
            
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            dayLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            mainTable.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 10),
            mainTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
    }
     
    private func setBackgroundImageView() {
        backgroundImageView.image = ImageConstants.background
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .boldSystemFont(ofSize: 25)
        dateLabel.numberOfLines = 0
        dateLabel.textAlignment = .center
        dateLabel.text = "Total russian losses on\n23.45.78889"
        view.addSubview(dateLabel)
    }
    
    private func setDayLabel() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.font = .boldSystemFont(ofSize: 20)
        dayLabel.textAlignment = .center
        dayLabel.text = "543 day of wars"
        view.addSubview(dayLabel)
    }
    
}


