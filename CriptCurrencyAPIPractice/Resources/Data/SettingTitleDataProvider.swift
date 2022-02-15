//
//  SettingTitleDataProvider.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-11.
//

import Foundation
import UIKit
class SettingTitleDataProvider{

    static func dataProvider() -> [(String, [Setting])]{
        var arrayCurrencyType = [Setting]()
        var arrayOfLanguageSelection = [Setting]()
    
        //arrayCurrencyType
        arrayCurrencyType.append(Setting(iconImage: UIImage(named: "all"), title: "All".localized(), isComplete: false))
        arrayCurrencyType.append(Setting(iconImage: UIImage(named: "currencies"), title: "Currencies".localized(), isComplete: false))
        arrayCurrencyType.append(Setting(iconImage: UIImage(named: "coins"), title: "Coins".localized(), isComplete: false))
        arrayCurrencyType.append(Setting(iconImage: UIImage(named: "gold"), title: "Gold".localized(), isComplete: false))
    
        //arrayOfLanguageSelection
        arrayOfLanguageSelection.append(Setting(iconImage: UIImage(named: "changeLanguage"), title: "Change Language".localized(), isComplete: false))
    
        return [
            (" ", arrayCurrencyType),
            (" ", arrayOfLanguageSelection)
        ]
    }
}


//
//static func dataProvider() -> [(String, [Setting])]{
//    var arrayCurrencyType = [Setting]()
//    var arrayOfLanguageSelection = [Setting]()
//
//    //arrayCurrencyType
//    arrayCurrencyType.append(Setting(iconImage: UIImage(named: "all"), title: "All", isComplete: false))
//    arrayCurrencyType.append(Setting(iconImage: UIImage(named: "currencies"), title: "Currencies", isComplete: false))
//    arrayCurrencyType.append(Setting(iconImage: UIImage(named: "coins"), title: "Coins", isComplete: false))
//    arrayCurrencyType.append(Setting(iconImage: UIImage(named: "gold"), title: "Gold", isComplete: false))
//
//    //arrayOfLanguageSelection
//    arrayCurrencyType.append(Setting(iconImage: UIImage(named: "changeLanguage"), title: "Change Language", isComplete: false))
//
//    return [
//    ]
