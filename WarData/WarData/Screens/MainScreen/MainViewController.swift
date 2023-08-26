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
    var mainDatum: MainDatum?
    var personnelData: PersonnelData?
    var personelDatum: PersonnelDatum?
    var datePickerView: DatePickerView?
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
    
    @objc func closeDatePickerView() {
        datePickerView?.removeFromSuperview()
    }
    
    
    @objc func openDatePicker(sender:UITapGestureRecognizer) {
        datePickerView = DatePickerView(frame: self.view.frame)
        datePickerView?.cancelButton.addTarget(self, action: #selector(closeDatePickerView), for: .touchUpInside)
        datePickerView?.okButton.addTarget(self, action: #selector(pushDateFromPicker), for: .touchUpInside)
        view.addSubview(datePickerView ?? UIView())
    }
    
    @objc func pushDateFromPicker() {
        guard let datePickerView = datePickerView else {return}
        let selectedDate = datePickerView.datePicker.date
        let searchDateString = selectedDate.formateDate()
        findMainDatumForDate(dateString: searchDateString)
        createRowData()
        closeDatePickerView()
    }
    
    func findMainDatumForDate(dateString: String) {
        mainDatum = mainData?.first(where: {$0.date == dateString})
        personelDatum = personnelData?.first(where: {$0.date == dateString})
        guard mainDatum != nil, personelDatum != nil else {
            //TODO: olya alert "date not found"
            print("not date found")
            return
        }
    }
    
    private func createRowData() {
        rowData = PrepareData.prepareDataToArray(titleArray, mainDatum: mainDatum, personnelDatum: personelDatum)
        dateLabel.text = mainDatum?.date
        let text = "Day  \(mainDatum?.day ?? 0)  of the War"
        dayLabel.text = text
    }
    
    private func getDataForTable() {
        mainData = networkManager.fetchData(resource: .main, of: MainData.self)
        personnelData = networkManager.fetchData(resource: .personnel, of: PersonnelData.self)
        mainDatum = mainData?.last
        personelDatum = personnelData?.last
        createRowData()
    }
    
    private func setTargetForDateLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(openDatePicker))
            dateLabel.isUserInteractionEnabled = true
            dateLabel.addGestureRecognizer(tap)
    }
    
}
    
    


