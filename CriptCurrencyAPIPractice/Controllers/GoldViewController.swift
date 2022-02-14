//
//  GoldViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit

class GoldViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    //=================== Elements =================
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var settingButton: UIBarButtonItem!
  //  @IBOutlet weak var collectionView: UICollectionView!
    var data = MainCollectionViewData.dataProvider()
    var indextitle = "Gold"
    
    lazy var collectionView: UICollectionView = {
        
        let viewLayout =  UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.systemGray5
        return cv
        
    }()
    
    
    
    //=================== Views ===============
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Gold"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    //=================== Functions ===============
    @IBAction func settingHandler(_ sender: Any) {
        
    }
    

    func coinInformationFinder() -> [CurrencyModel]{
        var array : [CurrencyModel] = []
        for i in data{
            print("i.0.title: \(i.0.title)")
            for j in i.1 {
                if i.0.title == "Gold".localized(){
                    array.append(j.self)
                    print("Success: \(i.1)")
                }
            }
        }
        print("array: \(array)")
        return  array
    }
}


extension GoldViewController : UICollectionViewDelegate {
    
}

extension GoldViewController : UICollectionViewDataSource {

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





//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = UIColor.white
//    title = "Gold"
//    // Do any additional setup after loading the view.
//}
//
//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    view.backgroundColor = UIColor.white
//
//    guard collectionView != nil else{ return }
//    view.addSubview(collectionView)
//    let viewLayout =  UICollectionViewFlowLayout()
//    viewLayout.scrollDirection = .vertical
//    viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    collectionView.collectionViewLayout = viewLayout
//    collectionView.backgroundColor = .white
//    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.backgroundColor = UIColor.systemGray5
//
//    collectionView.delegate = self
//    collectionView.dataSource = self
//    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//    collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
//
//    dateLabel.text = DateFormatters.dateForMatter(date: Date())
//
//}
