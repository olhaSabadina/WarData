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
    var dateLabel = UILabel()
    var dayLabel = UILabel()
    var mainData: MainData?
    var personnelData: PersonnelData?
    var datePicker: DatePickerView?
    var titleArray = MainTableTitles.titleArray
    var rowData: [RowData] = [] {
        didSet {
            mainTable.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getDataForTable()
        setConstreints()
        setTargetForDateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        dateLabel.cornerRadius(radius: 20, backColor: .black)
        dayLabel.borderRadius(radius: 15, layerColor: .lightGray, width: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func closeDatePicker() {
        datePicker?.removeFromSuperview()
    }
    
    @objc func pushDateFromPicker() {
        guard let selectedDate = datePicker?.datePicker.date.formaterDate("yyyy-MM-dd") else {return}
        
 
        closeDatePicker()
    }
    
    func selectedDateInDataArray(_ date: String?) {
        
        
        mainData = networkManager.fetchData(resource: .main, of: MainData.self)
        personnelData = networkManager.fetchData(resource: .personnel, of: PersonnelData.self)
        
        mainData?.forEach { mainDatum in
            let item = date == mainDatum.date ? mainDatum.self : mainData?.last
        }
       
            
        
        
        
    }
    
    @objc func openDatePicker(sender:UITapGestureRecognizer) {
        datePicker = DatePickerView(frame: self.view.frame)
        datePicker?.cancelButton.addTarget(self, action: #selector(closeDatePicker), for: .touchUpInside)
        datePicker?.okButton.addTarget(self, action: #selector(pushDateFromPicker), for: .touchUpInside)
        view.addSubview(datePicker ?? UIView())
    }
    
    func getDataForTable() {
        mainData = networkManager.fetchData(resource: .main, of: MainData.self)
        personnelData = networkManager.fetchData(resource: .personnel, of: PersonnelData.self)
        
        let mainDatum = mainData?.last
        
        rowData = PrepareData.prepareDataToArray(titleArray, mainDatum: mainDatum, personnelDatum: personnelData?.last)
        
        dateLabel.text = mainDatum?.date
        let text = "Day  \(mainDatum?.day ?? 0)  of the War"
        dayLabel.text = text
    }
    
    func setTargetForDateLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(openDatePicker))
            dateLabel.isUserInteractionEnabled = true
            dateLabel.addGestureRecognizer(tap)
    }
    
}
    
    


