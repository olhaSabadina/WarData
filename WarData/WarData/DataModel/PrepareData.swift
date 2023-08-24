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
}
