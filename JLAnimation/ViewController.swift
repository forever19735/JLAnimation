//
//  ViewController.swift
//  JLAnimation
//
//  Created by john.lin on 2018/11/7.
//  Copyright © 2018年 john.lin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func onRefresh(_ sender: UIBarButtonItem) {
        // Refresh table view here
        tableView.reloadData()
    }
    
    // MARK: - Table view data source and delegate methods
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Add animations here
        
        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
