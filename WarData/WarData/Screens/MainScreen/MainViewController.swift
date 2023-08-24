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
    var mainData: MainData?

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
        mainData = networkManager.fetchData(resource: .main, of: MainData.self)
        print(mainData?.count)
    }
    


}

