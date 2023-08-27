//
//  ViewController.swift
//  WarData
//
//  Created by Olga Sabadina on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let mainTable = UITableView()
    var dateLabel = UILabel()
    var dayLabel = UILabel()
    var personnelData: PersonnelData?
    var personelDatum: PersonnelDataObject?
    var rowData: [RowData] = [] {
        didSet {
            mainTable.reloadData()
        }
    }
    private let networkManager = NetworkManager()
    private var mainData: MainData?
    private var mainDataObject: MainDataObject?
    private var datePickerView: DatePickerView?
    private var mainTableTitlesData = MainTableTitlesData.titleArray

//MARK: - Life Cycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainScreenView()
        givDataForTable()
        setConstreints()
        setTargetForDateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        configureDateAndDayLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
    }
    
//MARK: - @objc Function:
    
    @objc func closeDatePickerView() {
        datePickerView?.removeFromSuperview()
    }
    
    @objc func openDatePicker(sender:UITapGestureRecognizer) {
        datePickerView = DatePickerView(frame: self.view.frame)
        guard let datePickerView = datePickerView else {return}
        datePickerView.datePickerSelectDate = mainDataObject?.date.transformStringToDate()
        datePickerView.maximumDate = mainData?.last?.date.transformStringToDate()
        datePickerView.minimumDate = mainData?.first?.date.transformStringToDate()
        datePickerView.cancelButton.addTarget(self, action: #selector(closeDatePickerView), for: .touchUpInside)
        datePickerView.okButton.addTarget(self, action: #selector(pushDateFromPicker), for: .touchUpInside)
        view.addSubview(datePickerView)
    }
    
    @objc func pushDateFromPicker() {
        guard let datePickerView = datePickerView else {return}
        let selectedDate = datePickerView.datePicker.date
        let searchDateString = selectedDate.formateDate()
        findMainDataObjectForDate(dateString: searchDateString)
        createRowData()
        closeDatePickerView()
    }
    
//MARK: - private Function:
    
    private func configureDateAndDayLabel() {
        dateLabel.cornerRadius(radius: 20, backColor: .black)
        dayLabel.borderRadius(radius: 15, layerColor: .lightGray, width: 1)
    }
    
    private func findMainDataObjectForDate(dateString: String) {
        mainDataObject = mainData?.first(where: {$0.date == dateString})
        personelDatum = personnelData?.first(where: {$0.date == dateString})
        guard mainDataObject != nil, personelDatum != nil else {
            alertDataNotFound()
            return
        }
    }
    
    private func alertDataNotFound() {
        let alert = UIAlertController(title: "Відсутні дані", message: "перевірте інтернет зʼєднання", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
    
    private func createRowData() {
        rowData = PrepareDataManager.mapMainDataToRowData(mainTableTitlesData, mainDataObject: mainDataObject, personnelDatum: personelDatum)
        dateLabel.text = mainDataObject?.date
        dayLabel.text = "Day \(mainDataObject?.day ?? 0) of war"
    }
    
    private func givDataForTable() {
        mainData = networkManager.fetchData(resource: .main, of: MainData.self)
        personnelData = networkManager.fetchData(resource: .personnel, of: PersonnelData.self)
        mainDataObject = mainData?.last
        personelDatum = personnelData?.last
        createRowData()
    }
    
    private func setTargetForDateLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(openDatePicker))
            dateLabel.isUserInteractionEnabled = true
            dateLabel.addGestureRecognizer(tap)
    }
}
