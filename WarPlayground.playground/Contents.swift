import UIKit

let titles = ["human", "tank", "pvo" ]
let rowMain = [String]()

struct RowData {
    let title: String
    let image: String
    let value: String
}

struct MainData: Codable {
    let aircraft: Int
    let  helicopter: Int
    let tank: Int
}
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case  aircraft
        case helicopter
        case tank
    }


struct HumanData {
    let pow: Int
    let dead: Int
}

let human = HumanData(pow: 25, dead: 50)
let mainData = MainData(aircraft: 56, helicopter: 78, tank: 90)


func preloadArray(mainData: MainData, humanData: HumanData) -> [RowData]{
  
    
    return
}


