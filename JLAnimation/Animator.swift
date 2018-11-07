//
//  Animator.swift
//  JLAnimation
//
//  Created by john.lin on 2018/11/7.
//  Copyright © 2018年 john.lin. All rights reserved.
//


import UIKit
import Foundation

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

enum AnimationType {
    case fade
    case bounce
    case moveAndFade
    case slide
}


class Animator {
    var hasAnimatedAllCells = false
    let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView){
        guard !hasAnimatedAllCells else {
            return
        }
        animation(cell, indexPath, tableView)
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
    
}


