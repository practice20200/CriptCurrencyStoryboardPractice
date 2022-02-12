//
//  HeaderCollectionReusableView.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-12.
//

import UIKit
import Elements

class HeaderCollectionReusableView : UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    lazy var iconImage : BaseUIImageView = {
        let imageView = BaseUIImageView()
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()
    
    lazy var titleLabel : BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    lazy var contentStack : HStack = {
        let stack = HStack()
        stack.addArrangedSubview(iconImage)
        stack.addArrangedSubview(titleLabel)
        stack.spacing = 5
        return stack
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setupView() {
        addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
    }
    
}
