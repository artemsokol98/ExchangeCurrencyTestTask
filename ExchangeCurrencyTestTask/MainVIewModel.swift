//
//  MainVIewModel.swift
//  ExchangeCurrencyTestTask
//
//  Created by Артем Соколовский on 13.01.2023.
//

import Foundation

class MainViewModel {
    
    @Published var currency: Currency?
    
    
    func fetchData() {
        NetworkManager.shared.fetchInformation(urlString: "https://www.cbr-xml-daily.ru/daily_json.js", expectingType: Currency.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let data = data as? Currency else { print("Casting failed"); return }
                    //print(data)
                    self.parseFetchedData(data: data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func parseFetchedData(data: Currency) {
        for item in data.valute {
            print(item.key)
            print(item.value.value)
        }
    }
}
