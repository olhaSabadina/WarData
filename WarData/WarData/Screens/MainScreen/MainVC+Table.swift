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
        mainTable.rowHeight = 44
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

        let titleItem = MainTableTitles.allCases[indexPath.row]
        var detailVC = DetailViewController()
        
        switch titleItem {
            
        case .personnel:
            let humanVC = HumanViewController()
            humanVC.personnelData = personnelData
            humanVC.personalDatum = personelDatum
            navigationController?.pushViewController(humanVC, animated: true)
            return
            
        case .aircraft:
            detailVC.filterTypeValue = .aircrafts
        case .helicopter:
            detailVC.filterTypeValue = .helicopters
        case .tank:
            detailVC.filterTypeValue = .tanks
        case .apc:
            detailVC.filterTypeValue = .armouredPersonnelCarriers
        case .fieldArtillery:
            detailVC.filterTypeValue = .artillerySystems
        case .mrl:
            detailVC.filterTypeValue = .multipleRocketLaunchers
        case .navalShip:
            detailVC.filterTypeValue = .warshipsBoats
        case .antiAircraftWarfare:
            detailVC.filterTypeValue = .antiAircraftWarfareSystems
        case .specialEquipment:
            detailVC.filterTypeValue = .specialEquipment
        case .vehiclesAndFuelTanks:
            detailVC.filterTypeValue = .vehicleAndFuelTank
        default: break
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


    


