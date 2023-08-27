//
//  DetailViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailCollection: UICollectionView?
    var filterTypeValue = EquipmentUa.aircrafts
    var equipmentsFilterData = [EquipmentFilterData]() {
        didSet {
            detailCollection?.reloadData()
        }
    }
    private let backgroundImageView = UIImageView()
    private let modelLabel = UILabel()
    private let lossesLabel = UILabel()
    private let manufacturerLabel = UILabel()
    private var infoStack = UIStackView()
    private var equipmentData: EquipmentData?
    private let networkManager = NetworkManager()
 
//MARK: - Life cycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
        setDetailCollectionView()
        setInfoStack()
        getDataForCollection()
        setConstraints()
    }
    
//MARK: - open Function:
    func selValueForStackLabel(data: EquipmentFilterData?) {
        guard let data = data else {return}
        modelLabel.text = data.model
        lossesLabel.text = "\(data.losses)"
        manufacturerLabel.text = data.manufacture
    }
    
//MARK: - private function:
    
    private func getDataForCollection() {
        equipmentData = networkManager.fetchData(resource: .equipment, of: EquipmentData.self)
        equipmentsFilterData = PrepareDataManager.mapEquipmentDataForFilterData(equipmentData, typeEquipment: filterTypeValue)
        selValueForStackLabel(data: equipmentsFilterData.first)
    }

    private func setupDetailView() {
        backgroundImageView.image = ImageConstants.backgroundForMainDetailScreens
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        title = DetailPageTitleConstants.titleScreenEquipment
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setInfoStack() {
        let labelsArray = [modelLabel, manufacturerLabel, lossesLabel]
        labelsArray.forEach { label in
            label.font = UIFont.digiFont(ofSize: 25)
            label.textColor = .yellow
            label.numberOfLines = 0
        }
        for (index, value) in labelsArray.enumerated() {
            let titleLabel = UILabel()
            titleLabel.text = DetailPageTitleConstants.arrayLabel[index]
            titleLabel.font = UIFont.digiFont(ofSize: 18)
            titleLabel.textAlignment = .right
            titleLabel.textColor = .yellow
            let stackH = UIStackView(arrangedSubviews: [titleLabel, value])
            stackH.axis = .horizontal
            stackH.spacing = 10
            stackH.distribution = .fillEqually
            infoStack.addArrangedSubview(stackH)
        }
        infoStack.axis = .vertical
        infoStack.spacing = 10
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
            collView.heightAnchor.constraint(equalToConstant: 350),
            
            infoStack.topAnchor.constraint(equalTo: collView.bottomAnchor, constant: 20),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            infoStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
