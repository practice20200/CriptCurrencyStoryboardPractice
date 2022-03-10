//
//  MainCollectionViewCell.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit
import Elements

protocol MainCollectionViewCellDelegate : AnyObject{
    func refreshAPIHandler()
}

class MainCollectionViewCell : UICollectionViewCell{
    var delegate : MainCollectionViewCellDelegate?
    
    
    //abave
    lazy var currencyIconImage: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()

    lazy var fullCurrencyTitle: BaseUILabel = {
        let label = BaseUILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var currencyTitle: BaseUILabel = {
        let label = BaseUILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    lazy var dollarTitleStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(fullCurrencyTitle)
        stack.addArrangedSubview(currencyTitle)
        stack.spacing = 5
        return stack
    }()
    
    lazy var aboveContentStack : HStack = {
        let stack = HStack()
        stack.addArrangedSubview(currencyIconImage)
        stack.addArrangedSubview(dollarTitleStack)
        return stack
    }()

    
    
    // below
    lazy var previousRate: BaseUILabel = {
        let label = BaseUILabel()
        //label.text = "User Name"
        label.textColor = UIColor.systemGray4
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var upToDateRate: BaseUILabel = {
        let label = BaseUILabel()
       // label.text = "User Name"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var belowStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(previousRate)
        stack.addArrangedSubview(upToDateRate)
        stack.spacing = 5
        return stack
    }()
    
    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(aboveContentStack)
        stack.addArrangedSubview(belowStack)
        return stack
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    override func select(_ sender: Any?) {
        super.select(sender)
        delegate?.refreshAPIHandler()
    }


    func setUpView(){
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor.white
       // contentView.collisionBoundingPath.stroke()
        contentView.addSubview(dollarTitleStack)
        contentView.addSubview(currencyIconImage)
        contentView.addSubview(belowStack)
        
        NSLayoutConstraint.activate([
            currencyIconImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            currencyIconImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
          
            dollarTitleStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            dollarTitleStack.leadingAnchor.constraint(equalTo: currencyIconImage.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            dollarTitleStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            belowStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            belowStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
           // belowStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        

    }
}
