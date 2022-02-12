//
//  SettingTableViewCell.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-11.
//

import UIKit
import Elements

class SettingTableViewCell: UITableViewCell {
    lazy var iconImage: BaseUIImageView = {
        let imageView = BaseUIImageView()
        return imageView
    }()
    
    lazy var titleLabel: BaseUILabel = {
        let label = BaseUILabel()
        return label
    }()
    
    
    lazy var contentStack : HStack = {
        let stack = HStack()
        stack.addArrangedSubview(iconImage)
        stack.addArrangedSubview(titleLabel)
        stack.spacing = 15
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    

    func setupView() {
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30)
        ])
    }
    
    
    

}
