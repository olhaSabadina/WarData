//
//  DetailViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailCollection: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setCollectionView()
        
    }

    private func setupView() {

        view.backgroundColor = .red
        navigationController?.navigationBar.isHidden = false
    }
    

    

}
