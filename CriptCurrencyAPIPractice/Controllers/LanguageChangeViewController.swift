//
//  LanguageChangeViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit
import Elements

class LanguageChangeViewController: UIViewController {

    var data = LanguageSelectionDataProvider.dataProvider()
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(SelectLanguageTableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor.systemGray6
        table.layer.shadowColor = UIColor.lightGray.cgColor
        table.layer.opacity = 0.8
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Select a language".localized()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        //view.addSubview(tableView?)
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            //tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
        
        
        print("count1: \(data)")
//        tableView.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
//        tableView.reloadData()
    }

}




extension LanguageChangeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = data[indexPath.row].title
        print("index: \(index)")
        for _ in data {
            if index == "English".localized(){
                print("+++++++++++++++++++++++")
                data[indexPath.row].isComplete = true
                data[1].isComplete = false
                print("title1:\(data[indexPath.row].title)")
                print("isComplete1:\(data[indexPath.row].isComplete)")
                print("+++++++++++++++++++++++")
            }else if index == "Japanese".localized(){
                print("=======================")
                data[indexPath.row].isComplete = true
                data[0].isComplete = false
                print("title2: :\(data[indexPath.row].title )")
                print("isComplete2:\(data[indexPath.row].isComplete)")
                print("=======================")
            }

        }
        tableView.reloadData()
    }
}

extension LanguageChangeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectLanguageTableViewCell
        let item = data[indexPath.row]
        cell.iconImage.image = item.iconImage
        cell.titleLabel.text = item.title
        cell.accessoryType = item.isComplete ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


