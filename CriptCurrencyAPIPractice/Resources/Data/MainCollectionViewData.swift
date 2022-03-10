//
//  MainCollectionViewData.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import Foundation
import UIKit


struct IndexTitle{
    var icon : UIImage?
    var title : String
}

class MainCollectionViewData {
    
    static func dataProvider() -> [ (IndexTitle, [CurrencyModel] ) ] {
        var arrayOfCurrencies : [CurrencyModel] = []
        var arrayOfCoins : [CurrencyModel] = []
        var arrayOfGold : [CurrencyModel] = []
        
       
        //=====Currency
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "100000"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "EUFlag"),
                                   fullCurrencyTitle: "Euro",
                                   currencyTitle: "EUR",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "BritishFlag"),
                                   fullCurrencyTitle: "British Pound",
                                   currencyTitle: "GBP",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "SwissFlag"),
                                   fullCurrencyTitle: "Swiss Franc",
                                   currencyTitle: "CHF",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "CanadaFlag"),
                                   fullCurrencyTitle: "Canadian Dollar",
                                   currencyTitle: "CAD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AustraliaFlag"),
                                   fullCurrencyTitle: "Australian Dollar",
                                   currencyTitle: "AUD",
                                   previousRate: "26400",
                                   upToDateRate: "100000"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "NorwayFlag"),
                                   fullCurrencyTitle: "Norwegian Krone",
                                   currencyTitle: "NOK",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "RussiaFlag"),
                                   fullCurrencyTitle: "Russian Ruble",
                                   currencyTitle: "RUB",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
       

        //========Coin=======
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: "fullMoon"), fullCurrencyTitle: "“Bitcoin”".localized(), currencyTitle: "BTC", previousRate: "11", upToDateRate: "11"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: "bigCrescentMoon"), fullCurrencyTitle: "Ether".localized(), currencyTitle: "ETH", previousRate: "22", upToDateRate: "22"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: "halfMoon"), fullCurrencyTitle: "“Bitcoin".localized(), currencyTitle: "LTC", previousRate: "33", upToDateRate: "33"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: "smallCrescentMoon"), fullCurrencyTitle: "“Bitcoin".localized(), currencyTitle: "BCH", previousRate: "44", upToDateRate: "44"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: "newMoon"), fullCurrencyTitle: "Binance".localized(), currencyTitle: "BNB", previousRate: "55", upToDateRate: "55"))

        
        //=======Gold========
        arrayOfGold.append(CurrencyModel(currencyIcon: UIImage(named: "gold"), fullCurrencyTitle: "Silver".localized(), currencyTitle: "XAG", previousRate: "Silver", upToDateRate: "11"))
        arrayOfGold.append(CurrencyModel(currencyIcon: UIImage(named: "gold"), fullCurrencyTitle: "Gold".localized(), currencyTitle: "XAU", previousRate: "222", upToDateRate: "222"))
        
        
        
        return [
            (IndexTitle(icon: UIImage(named: "currencies"), title: "Currencies".localized()), arrayOfCurrencies),
            (IndexTitle(icon: UIImage(named: "coins"), title: "Coins".localized()), arrayOfCoins),
            (IndexTitle(icon: UIImage(named: "gold"), title: "Gold".localized()), arrayOfGold)
        
        ]
        
    }
  
}
