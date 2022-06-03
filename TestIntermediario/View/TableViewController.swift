//
//  TableViewController.swift
//  TestIntermediario
//
//  Created by user208023 on 6/2/22.
//

import UIKit

class TableViewController: UIViewController {
    
    let tableViewViewModel = TableViewViewModel()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        tableViewViewModel.networkCoins { result, error in
            if result {
                print("CoinData Ok")
                self.myTableView.reloadData()
            } else {
                print(error!)
            }
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell? = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        
        DispatchQueue.main.async {
            cell?.setup(label: self.tableViewViewModel.getLabel(indexPath: indexPath), rate: self.tableViewViewModel.getRate(indexPath: indexPath))
        }
        
        
        return cell ?? UITableViewCell()
    }
    
    
}
