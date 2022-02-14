//
//  CurrenciesViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit
import Elements

class √: UIViewController, UICollectionViewDelegateFlowLayout {
    
    //=================== Elements ===============
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = MainCollectionViewData.dataProvider()
    var indextitle = "Currency"

    
    
    //=================== Views ===============
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Currencies"

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       
        guard collectionView != nil else{ return }
        view.addSubview(collectionView)
        let viewLayout =  UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = viewLayout
        collectionView.backgroundColor = .yellow
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.systemGray5

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        timeLabel.text = DateFormatters.dateForMatter(date: Date())
        
        
        
    }
    
    //=================== Functions ===============
    @IBAction func settingHandler(_ sender: Any) {
        
    }
    
    func coinInformationFinder() -> [CurrencyModel]{
        var array : [CurrencyModel] = []
        for i in data{
            print("i.0.title: \(i.0.title)")
            for j in i.1 {
                if i.0.title == "Coins".localized(){
                    array.append(j.self)
                    print("Success: \(i.1)")
                }
            }
        }
        print("array: \(array)")
        return  array
    }
    
    
}

extension CurrenciesViewController : UICollectionViewDelegate {
    
}

extension CurrenciesViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinInformationFinder().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        let item = coinInformationFinder()[indexPath.row]
        cell.currencyIconImage.image = item.currencyIcon
        cell.fullCurrencyTitle.text = item.fullCurrencyTitle
        cell.currencyTitle.text = item.currencyTitle
        cell.previousRate.text = item.previousRate
        cell.upToDateRate.text = item.upToDateRate
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/4)
        let width = (collectionView.frame.width * 1/2)-30
        return CGSize(width: width, height: height)
    }

}

