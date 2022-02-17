//
//  SettingsViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var data = SettingTitleDataProvider.dataProvider()
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor.systemGray6
        table.layer.shadowColor = UIColor.lightGray.cgColor
        table.layer.opacity = 0.8
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            //tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
   
    }
    
    //=================== Function ====================
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


    
}

extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = data[indexPath.section].1[indexPath.row].title
        print("index: \(index)")
        
        for _ in data {
            if index == "All"{
                print("+++++++++++++++++++++++")
                data[indexPath.section].1[indexPath.row].isComplete = true
                data[indexPath.section].1[1].isComplete = false
                data[indexPath.section].1[2].isComplete = false
                data[indexPath.section].1[3].isComplete = false
                print("title1:\(data[indexPath.section].1[indexPath.row].title)")
                print("isComplete1:\(data[indexPath.section].1[indexPath.row].isComplete)")
                print("+++++++++++++++++++++++")
            }else if index == "Currencies"{
                print("=======================")
                data[indexPath.section].1[indexPath.row].isComplete = true
                data[indexPath.section].1[0].isComplete = false
                data[indexPath.section].1[2].isComplete = false
                data[indexPath.section].1[3].isComplete = false
                print("title2: :\(data[indexPath.section].1[indexPath.row].title )")
                print("isComplete2:\(data[indexPath.section].1[indexPath.row].isComplete)")
                print("=======================")
            }else if index == "Coins"{
                print("=======================")
                data[indexPath.section].1[indexPath.row].isComplete = true
                data[indexPath.section].1[0].isComplete = false
                data[indexPath.section].1[1].isComplete = false
                data[indexPath.section].1[3].isComplete = false
                print("title2: :\(data[indexPath.section].1[indexPath.row].title )")
                print("isComplete2:\(data[indexPath.section].1[indexPath.row].isComplete)")
                print("=======================")
            }else if index == "Gold"{
                print("=======================")
                data[indexPath.section].1[indexPath.row].isComplete = true
                data[indexPath.section].1[0].isComplete = false
                data[indexPath.section].1[1].isComplete = false
                data[indexPath.section].1[2].isComplete = false
                print("title2: :\(data[indexPath.section].1[indexPath.row].title )")
                print("isComplete2:\(data[indexPath.section].1[indexPath.row].isComplete)")
                print("=======================")
            }

        }
        tableView.reloadData()
  
        
        
        
        if index == "All".localized(){
            let vc = ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Currencies".localized(){
            let vc = CurrenciesViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Coins".localized(){
            let vc = CoinsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Gold".localized(){
            let vc = GoldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Change Language".localized(){
            let vc = LanguageChangeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
    }
}

extension SettingsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        let item = data[indexPath.section].1[indexPath.row]
        cell.iconImage.image = item.iconImage
        cell.titleLabel.text = item.title
        cell.accessoryType = item.isComplete ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].0
     }
}


