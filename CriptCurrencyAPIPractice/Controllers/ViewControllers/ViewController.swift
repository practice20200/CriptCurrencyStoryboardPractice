//
//  ViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-03.
//

import UIKit
import Elements

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    //================ Elements =================
    @IBOutlet weak var settings: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    static var btcPrice = ""
    static var ethPrice = ""
    static var usdPrice = ""
    static var ausdPric = ""
   
    
    var data = MainCollectionViewData.dataProvider()
    var indextitle = ["Currency", "Coins", "Gold"]
    //@IBOutlet weak var btcPrice: UILabel!
//    @IBOutlet weak var ethPrice: UILabel!
//    @IBOutlet weak var usdPrice: UILabel!
//    @IBOutlet weak var ausdPric: UILabel!
//    @IBOutlet weak var lastUpdatePrice: UILabel!
//
    let urlString =  "https://api.coingecko.com/api/v3/exchange_rates"
//
    
    
 
    //================ Views =================
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        let _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "coinsVCID") as! CoinsViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
//
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       
        guard collectionView != nil else{
            print("Here: error as well===============")
            return }
        print("Here: Successsssssss as well===============")
        view.addSubview(collectionView)
        let viewLayout =  UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = viewLayout
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.systemGray5
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
    }
    
    
    //================ functions =================
    @IBAction func settingHandler(_ sender: Any) {
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    func fetchData(){
        guard let url = URL(string: urlString) else{ return }
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url){ (data: Data?, response: URLResponse?, error: Error?) in

//            guard let error != nil else{ return }
//            guard let data != nil else{ return }

            if error != nil{ return }

            do{
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrices(currency:  json.rates)
            }catch{
                print("erorr")
                return
            }

        }
        dataTask.resume()
    
    }

    func setPrices(currency: Currency){
        DispatchQueue.main.async {
//            self.btcPrice.text = self.formatPrice(currency.btc)
//            self.ethPrice.text = self.formatPrice(currency.eth)
//            self.usdPrice.text = self.formatPrice(currency.usd)
//            self.ausdPric.text = self.formatPrice(currency.aud)
            self.dateLabel?.text = DateFormatters.dateForMatter(date: Date())
        }
    }

    func formatPrice(_ price: Price) -> String{
        return String(format: "%@ %.4f", price.unit, price.value)
    }

    @objc func refreshData() -> Void{
        fetchData()
    }
}



extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        let item = data[indexPath.section].1[indexPath.row]
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


    
    //=========Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView
        else { return UICollectionReusableView()}

        header.iconImage.image = data[indexPath.section].0.icon
        header.titleLabel.text = data[indexPath.section].0.title
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 20)
    }
    
    
}


extension String{
    func localized() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
