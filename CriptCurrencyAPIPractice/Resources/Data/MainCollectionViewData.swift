//
//  MainCollectionViewData.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import Foundation
import UIKit

class MainCollectionViewData {
    static func dataProvider() -> [CurrencyModel] {
        var array : [CurrencyModel] = []
        array.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        array.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        array.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        array.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        array.append(CurrencyModel(currencyIcon: UIImage(named: "AmericanFlag"),
                                   fullCurrencyTitle: "US Dollar",
                                   currencyTitle: "USD",
                                   previousRate: "26400",
                                   upToDateRate: "26500"))
        return array
    }
}
