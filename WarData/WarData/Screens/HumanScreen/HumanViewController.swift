//
//  HumanViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class HumanViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let previousDayButton = UIButton(type: .system)
    private let nextDayButton = UIButton(type: .system)
    private var stack = UIStackView()
    private var dateLabel = UILabel()
    private var indexPersonnale = 0
    
    var collectionView : UICollectionView?
    var personnelData: PersonnelData?
    var personalDatum: PersonnelDataObject?
    var itemsData: [HumanItemData] = [] {
        didSet {
            configureScreen()
        }
    }

//MARK: - Life cycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setCollectionView()
        setDateLabel()
        setButtons()
        setStack()
        setConstraints()
        configureItemData()
    }
    
//MARK: - @objc Functions:
    @objc func changeDay(_ sender: UIButton) {
        
        if sender == previousDayButton {
            guard indexPersonnale > 0 else {return}
            indexPersonnale -= 1
            if indexPersonnale == 0 {
                personalDatum = personnelData?[indexPersonnale]
                itemsData =  PrepareDataManager.preparePersonnelArray(personalDatum, previousDay: nil)
            } else {
                personalDatum = personnelData?[indexPersonnale]
                itemsData = PrepareDataManager.preparePersonnelArray(personalDatum, previousDay: personnelData?[indexPersonnale-1])
            }
            
        } else {
            
            guard indexPersonnale < giveMaxIndex() else {return}
            indexPersonnale += 1
            personalDatum = personnelData?[indexPersonnale]
            itemsData = PrepareDataManager.preparePersonnelArray(personalDatum, previousDay: personnelData?[indexPersonnale-1])
        }
    }
    
//MARK: - private Functions:
        
    private func setView() {
        title = "Особовий склад"
        backgroundImageView.image = ImageConstants.backgroundHuman
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureItemData() {
        guard let index = personnelData?.firstIndex(where: {$0.date == personalDatum?.date}) else {return}
        indexPersonnale = index
        let indexRight = indexPersonnale == 0 ? 0 : indexPersonnale - 1
        itemsData = PrepareDataManager.preparePersonnelArray(personalDatum, previousDay: personnelData?[indexRight])
    }
    
    private func configureScreen() {
        dateLabel.text = personalDatum?.date
        collectionView?.reloadData()
    }
    
    private func setStack() {
        stack = UIStackView(arrangedSubviews: [previousDayButton, dateLabel, nextDayButton])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
    }
    
    private func setDateLabel() {
        dateLabel = PaddingLabel(withInsets: 5, 5, 15, 15)
        dateLabel.font = UIFont.digiFont(ofSize: 28)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
    }
    
    private func setButtons() {
        let imageForTitle = ["chevron.backward","chevron.right"]
        let buttons = [previousDayButton, nextDayButton]
        buttons.enumerated().forEach { index, button in
            button.cornerRadius(radius: 25, backColor: .black)
            button.tintColor = .white
            button.setImage(UIImage(systemName: imageForTitle[index]), for: .normal)
        }
        previousDayButton.addTarget(self, action: #selector(changeDay(_:)), for: .touchUpInside)
        nextDayButton.addTarget(self, action: #selector(changeDay(_:)), for: .touchUpInside)
    }
    
    private func giveMaxIndex() -> Int {
        guard let personnelData = personnelData else {return 0}
        let maxIndex = personnelData.count - 1
        return maxIndex
    }
    
//MARK: - SetConstraints:
    
    private func setConstraints() {
        guard let collView = collectionView else {return}
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collView.topAnchor.constraint(equalTo: view.topAnchor),
            collView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collView.bottomAnchor.constraint(equalTo: stack.topAnchor),
            
            stack.heightAnchor.constraint(equalToConstant: 50),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            nextDayButton.widthAnchor.constraint(equalTo: previousDayButton.widthAnchor),
            nextDayButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
