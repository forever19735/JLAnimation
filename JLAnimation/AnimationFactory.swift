//
//  AnimationFactory.swift
//  JLAnimation
//
//  Created by john.lin on 2018/11/7.
//  Copyright © 2018年 john.lin. All rights reserved.
//

import UIKit

enum AnimationFactory {
    static func makeFadeAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.alpha = 0
            UIView.animate(withDuration: duration, delay: delayFactor * Double(indexPath.row), animations: {
                cell.alpha = 1
            }, completion: nil)
        }
    }
    
    static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row), usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 0.1,
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                            
            }, completion: nil)
        }
    }
    
    static func makeMoveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0
            UIView.animate(withDuration: duration, delay: delayFactor * Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
    
    static func makeSlideIn(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
            UIView.animate(withDuration: duration, delay: delayFactor * Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
        }
    }
    static func makeCustomAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            let cells = tableView.visibleCells
            for i in 0...cells.count {
                if (i % 2 == 0) {
                    cell.transform = CGAffineTransform(translationX: -tableView.bounds.width, y: 0)
                } else {
                    cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
                }
                UIView.animate(withDuration: duration,
                               delay: delayFactor * Double(indexPath.row), usingSpringWithDamping: 0.4,
                               initialSpringVelocity: 0.1,
                               options: [.curveEaseInOut],
                               animations: {
                                cell.transform = CGAffineTransform.identity
                                
                }, completion: nil)
            }
        }
    }
}
