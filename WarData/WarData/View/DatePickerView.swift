//
//  DatePickerView.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

class DatePickerView: UIView {
    
    private let titleLabel = UILabel()
    private let view = UIView()
    
    let datePicker = UIDatePicker()
    let okButton = UIButton(type: .system)
    let cancelButton = UIButton(type: .system)
    var maximumDate: Date?
    var datePickerSelectDate: Date?
    
    var minimumDate: Date? {
        didSet {
            configureDatePicker()
        }
    }
   
//MARK: - init:
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setBlurEffect()
        setUpView()
        configViewElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - private function:
    private func setUpView() {
        addSubview(view)
        view.addSubview(datePicker)
        view.addSubview(titleLabel)
        view.addSubview(okButton)
        view.addSubview(cancelButton)
    }
    
    private func configViewElements() {
        view.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        configureView()
        configureTitleLabel()
        configureButtons()
        configureDatePicker()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 2, height: 5)
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
    }
    
    private func setBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight )
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Оберіть день для пошуку втрат у війні:"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.digiFont(ofSize: 18)
    }
    
    private func configureButtons() {
        okButton.setTitle("Обрати", for: .normal)
        cancelButton.setTitle("Скасувати", for: .normal)
        let buttons = [okButton,cancelButton]
        buttons.forEach { button in
            button.backgroundColor = UIColor.systemGray2
            button.tintColor = .black
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 15
        }
    }
    
    private func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = maximumDate
        datePicker.minimumDate = minimumDate
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "uk")
        guard let date = datePickerSelectDate else {return}
        datePicker.date = date
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: 35),
            
            okButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -15),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            okButton.heightAnchor.constraint(equalToConstant: 35),
            
            datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            datePicker.bottomAnchor.constraint(lessThanOrEqualTo: okButton.topAnchor, constant: -16)
        ])
    }
}
