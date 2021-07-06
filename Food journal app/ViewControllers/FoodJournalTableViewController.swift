//
//  FoodJournalTableViewController.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class FoodJournalTableViewController: UITableViewController {

    var foodEntries = [FoodEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodEntries = DatabaseHelper.shared.fetchFoodEntry()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150.0
        tableView.separatorStyle = .none
        
        view.backgroundColor = .white
        self.navigationItem.title = "My food journal"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewFoodEntry))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        foodEntries = DatabaseHelper.shared.fetchFoodEntry()
        self.tableView.reloadData()
    }

    @objc func addNewFoodEntry() {
        let vc = UINavigationController(rootViewController: AddFoodViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FoodEntryCell()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        cell.foodImage.image = UIImage(data: foodEntries[indexPath.row].foodImage!)
        cell.foodDescription.text = foodEntries[indexPath.row].entryDescription
        cell.entryDate.text = dateFormatter.string(from: foodEntries[indexPath.row].entryDate!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FoodEntryDetailViewController()
        vc.foodImage.image = UIImage(data: foodEntries[indexPath.row].foodImage!)
        vc.entryDescription.text = foodEntries[indexPath.row].entryDescription
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .popover
        present(nc, animated: true, completion: nil)
        
    }
}
