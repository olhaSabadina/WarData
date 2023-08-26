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

struct PrepareData {
    
   static func prepareDataToArray(_ titleArrayForShow: [String], mainDatum: MainDatum?, personnelDatum: PersonnelDatum?) -> [RowData] {
       guard let mainDatum = mainDatum, let personnelDatum = personnelDatum else {return []}
        let mainDatumArrayForShow = mainDatum.mainDatumArrayForShow
        var resultRowData = [RowData]()

        for (index, text) in titleArrayForShow.enumerated() {
            var value: String? = ""
            if index == 0 {
                value = "\(personnelDatum.personnel)"
            } else {
                value = mainDatumArrayForShow[index]
            }
            
            let rowData = RowData(title: text,
                                  image: "",
                                  value: value)
            resultRowData.append(rowData)
        }
        return resultRowData
    }
    
    
    static func preparePersonnelArray(_ personnalDatum: PersonnelDatum?, previousDay: PersonnelDatum?) -> [HumanItemData] {
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
}
