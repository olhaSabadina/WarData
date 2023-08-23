//
//  NetworkManager.swift
//  WarData
//
//  Created by Olga Sabadina on 23.08.2023.
//

import Foundation

struct NetworkManager {
    
    func fetchData(completionhandler: @escaping (Result<MainData?, Error>)->Void) {

        guard let url = Bundle.main.url(forResource: "main", withExtension: "json") else { print("не нашол файл")
            return}
        do {
            let data = try Data(contentsOf: url)
            let dataModel = self.parseJSON(data: data)
            completionhandler(.success(dataModel))
        } catch {
            print("not catch")
        }
    }
    
    private func parseJSON(data: Data) -> MainData? {
        let decoder = JSONDecoder()
        do{
            let mainData = try decoder.decode(MainData.self, from: data)
            print(mainData.count)
            return mainData
            
        } catch {
            print(WarDataErrors.errorParsing)
        }
        return nil
    }
    
}
