//
//  DetailViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailCollection: UICollectionView?
    let backgroundImageView = UIImageView()
    let modelLabel = UILabel()
    let lossesLabel = UILabel()
    let manufacturerLabel = UILabel()
    var infoStack = UIStackView()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setCollectionView()
        setInfoStack()
        setConstraints()
    }

    private func setupView() {
        backgroundImageView.image = ImageConstants.background
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        title = "Обладнання"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = false
    }
    
    func setInfoStack() {
        let labelsArray = [modelLabel, manufacturerLabel, lossesLabel]
        for (index, value) in labelsArray.enumerated() {
            let titleLabel = UILabel()
            titleLabel.text = Constant.arrayLabel[index]
            titleLabel.font = .systemFont(ofSize: 21)
            titleLabel.textAlignment = .right
            titleLabel.textColor = .yellow
            let stackH = UIStackView(arrangedSubviews: [titleLabel, value])
            stackH.axis = .horizontal
            stackH.spacing = 10
            stackH.distribution = .fillEqually
            infoStack.addArrangedSubview(stackH)
        }
        infoStack.backgroundColor = .gray.withAlphaComponent(0.5)
        infoStack.borderRadius(radius: 10, layerColor: .darkGray, width: 1)
        infoStack.axis = .vertical
        infoStack.spacing = 10
        infoStack.distribution = .fillEqually
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoStack)
    }
    
    private func setConstraints() {
        guard let collView = detailCollection else {return}
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collView.heightAnchor.constraint(equalToConstant: 300),
            
            infoStack.topAnchor.constraint(equalTo: collView.bottomAnchor, constant: 20),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            infoStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    

}
