//
//  FoodJournalTableViewController.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class FoodJournalTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        self.navigationItem.title = "My food journal"
        
        tableView.rowHeight = 150.0
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FoodEntryCell()
        
        return cell
    }
}
