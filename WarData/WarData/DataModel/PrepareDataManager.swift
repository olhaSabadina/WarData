//
//  PrepareData.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import Foundation

struct RowData {
    let title: String
    let image: String
    let value: String?
}

struct HumanItemData {
    let image: String
    let value: String
    let day: String
    let dailyLoss: Int
}

struct EquipmentFilterData {
    let nameEquipment: String
    let model: String
    let manufacture: String
    let losses: Int
}

struct PrepareDataManager {
    
    static func prepareDataToArray(_ titleArrayForShow: [String], mainDataObject: MainDataObject?, personnelDatum: PersonnelDataObject?) -> [RowData] {
        guard let mainDataObject = mainDataObject, let personnelDatum = personnelDatum else {return []}
        let mainDataObjectArrayForShow = mainDataObject.mainDataObjectArrayForShow
        var resultRowData = [RowData]()
        
        for (index, text) in titleArrayForShow.enumerated() {
            var value: String? = ""
            if index == 0 {
                value = "\(personnelDatum.personnel)"
            } else {
                value = mainDataObjectArrayForShow[index]
            }
            
            let rowData = RowData(title: text,
                                  image: EquipmentUa.allCases[index].rawValue,
                                  value: value)
            resultRowData.append(rowData)
        }
        return resultRowData
    }
    
    static func preparePersonnelArray(_ personnalDatum: PersonnelDataObject?, previousDay: PersonnelDataObject?) -> [HumanItemData] {
        var array = [HumanItemData]()
        guard let personnalDatum = personnalDatum else { return array}
        for i in ImageForPersonnel.allCases {
            var value: String
            var lossDay = 0
            switch i {
            case .deadHuman:
                value = "знищено   \n \(personnalDatum.personnel)"
                if let previous = previousDay {
                    lossDay = personnalDatum.personnel - previous.personnel
                }
            case .powHuman:
                value = "полоненних\n \(personnalDatum.pow ?? 0)"
            }
            
            let item = HumanItemData(image: i.rawValue, value: "\(value)", day: "\(personnalDatum.day)", dailyLoss: lossDay)
            array.append(item)
        }
        return array
    }
    
    static func prepareEquipmentData(_ equipmentData: EquipmentData?, typeEquipment: EquipmentUa) -> [EquipmentFilterData] {
        
        var resultArray = [EquipmentFilterData]()
        
        guard let equipmentData = equipmentData else {return resultArray}
        
        let equipmentArrayFiltered = equipmentData.filter{$0.equipmentUa == typeEquipment}
        
        for equip in equipmentArrayFiltered {
            let item = EquipmentFilterData(nameEquipment: equip.equipmentUa.rawValue, model: equip.model, manufacture: equip.manufacturer.rawValue, losses: equip.lossesTotal)
            
            resultArray.append(item)
        }
        return resultArray
    }
}
