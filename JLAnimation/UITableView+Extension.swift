//
//  UITableView+Extension.swift
//  JLAnimation
//
//  Created by john.lin on 2018/11/7.
//  Copyright © 2018年 john.lin. All rights reserved.
//

import UIKit

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        
        return lastIndexPath == indexPath
    }
}
