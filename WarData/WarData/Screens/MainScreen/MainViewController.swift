//
//  ViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    let backgroundImageView = UIImageView()
    let mainTable = UITableView()
    let dateLabel = UILabel()
    let dayLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getMainData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstreints()
    }
    
    func getMainData() {
        networkManager.fetchData { result in
            switch result {
                
            case .success(let data):
                print(data?.last?.date)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    


}

