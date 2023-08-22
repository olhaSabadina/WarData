//
//  GeneralVC+UIConfig.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

//MARK: - Set UIConfiguration & constraints:

extension GeneralViewController {
    
    func configView() {
        setupView()
        setBackgroundImageView()
        setGeneralTable()
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            generalTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            generalTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            generalTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
     
    private func setBackgroundImageView() {
        backgroundImageView.image = ImageConstants.background
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
    }
    
    
    
}


