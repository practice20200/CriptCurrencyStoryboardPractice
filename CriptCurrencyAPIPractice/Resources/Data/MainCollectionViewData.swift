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
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        arrayOfCurrencies.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))


        
        
        //========Coin=======
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "Azadi", currencyTitle: "", previousRate: "11", upToDateRate: "11"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "Emami", currencyTitle: "", previousRate: "22", upToDateRate: "22"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "%Azadi", currencyTitle: "", previousRate: "33", upToDateRate: "33"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "%Azadi", currencyTitle: "", previousRate: "44", upToDateRate: "44"))
        arrayOfCoins.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "Geramy", currencyTitle: "", previousRate: "55", upToDateRate: "55"))
        
        //=======Gold========
        arrayOfGold.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "Gram", currencyTitle: "", previousRate: "111", upToDateRate: "11"))
        arrayOfGold.append(CurrencyModel(currencyIcon: UIImage(named: ""), fullCurrencyTitle: "MythQal", currencyTitle: "", previousRate: "222", upToDateRate: "222"))
        
        
        
        return [
            (IndexTitle(icon: UIImage(named: "currencies"), title: "Currencies"), arrayOfCurrencies),
            (IndexTitle(icon: UIImage(named: "coins"), title: "Coins"), arrayOfCoins),
            (IndexTitle(icon: UIImage(named: "gold"), title: "Gold"), arrayOfGold)
        
        ]
        
    }
}

