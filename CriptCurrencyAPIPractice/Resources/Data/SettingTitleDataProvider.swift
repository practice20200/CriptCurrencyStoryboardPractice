//
//  SettingTitleDataProvider.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-11.
//

import Foundation
import UIKit
class SettingTitleDataProvider{
    static func dataProvider() -> [Setting]{
        var array = [Setting]()
        array.append(Setting(iconImage: UIImage(named: "all"), title: "All", isComplete: false))
        array.append(Setting(iconImage: UIImage(named: "currencies"), title: "Currencies", isComplete: false))
        array.append(Setting(iconImage: UIImage(named: "coins"), title: "Coins", isComplete: false))
        array.append(Setting(iconImage: UIImage(named: "gold"), title: "Gold", isComplete: false))
        array.append(Setting(iconImage: UIImage(named: "changeLanguage"), title: "Change Language", isComplete: false))
        return array 
    }
}
