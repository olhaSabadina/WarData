//
//  HumanViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class HumanViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    var collectionView : UICollectionView?
    var stack = UIStackView()
    var dateLabel = UILabel()
    let previousDayButton = UIButton(type: .system)
    let nextDayButton = UIButton(type: .system)
    var personnelData: PersonnelData?
    var personalDatum: PersonnelDatum?
    var indexPersonnale = 0
    var itemsData: [HumanItemData] = [] {
        didSet {
            configureScreen()
            collectionView?.reloadData()
        }
    }


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
    
    private func setView() {
        title = "Особовий склад"
        backgroundImageView.image = ImageConstants.backgroundHuman
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureItemData() {
        guard let index = personnelData?.count else {return}
        indexPersonnale = index - 1
        personalDatum = personnelData?[indexPersonnale]
        itemsData = PrepareData.preparePersonnelArray(personalDatum)
        print(itemsData.count)
    }
    
    func configureScreen() {
        dateLabel.text = personalDatum?.date
        collectionView?.reloadData()
    }
    
    func setStack() {
        stack = UIStackView(arrangedSubviews: [previousDayButton, dateLabel, nextDayButton])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
    }
    
    func setDateLabel() {
        dateLabel = PaddingLabel(withInsets: 5, 5, 15, 15)
        dateLabel.font = UIFont(name: "DS-Digital-Bold", size: 28)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        dateLabel.text = "2023-05-08"
    }
    
    func setButtons() {
        let buttons = [previousDayButton, nextDayButton]
        buttons.forEach { button in
            button.cornerRadius(radius: 25, backColor: .black)
            button.tintColor = .white
        }
        previousDayButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        nextDayButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
    
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
