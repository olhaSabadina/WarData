//
//  HumanViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import UIKit

class HumanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        navigationController?.navigationBar.isHidden = false
        
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}
