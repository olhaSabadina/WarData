//
//  GeneralVC+Table.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func setMainTable() {
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        mainTable.backgroundColor = .clear
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.showsVerticalScrollIndicator = false
        
        mainTable.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.cellID)
        
        view.addSubview(mainTable)
        
    }
    
// MARK: - TableView Delegate, DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.cellID, for: indexPath) as? MainTableCell else {return UITableViewCell()}
        cell.rowData = rowData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
       
//        var detailVC: UIViewController?
        let titleItem = MainTableTitles.allCases[indexPath.row]
        switch titleItem {
        case .personnel: let detailVC = HumanViewController()
            detailVC.personnelData = personnelData
            navigationController?.pushViewController(detailVC, animated: true)
        case .tank: let detailVC = DetailViewController()
            navigationController?.pushViewController(detailVC, animated: true)
        default: break
        }
//        guard let detailVC = detailVC else {return}
//        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


    


