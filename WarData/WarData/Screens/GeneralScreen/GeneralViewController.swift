//
//  ViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class GeneralViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let generalTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstreints()
    }
    
    
    


}

