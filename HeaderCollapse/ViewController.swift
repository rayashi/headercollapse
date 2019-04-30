//
//  ViewController.swift
//  HeaderCollapse
//
//  Created by Humberto Rayashi on 30/04/19.
//  Copyright © 2019 Humberto Rayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    let headerMaxHeight: CGFloat = 180
    let headerMinHeight: CGFloat = 44 + UIApplication.shared.statusBarFrame.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition: CGFloat = scrollView.contentOffset.y
        let newHeaderHeight: CGFloat = headerHeightConstraint.constant - yPosition
        
        if newHeaderHeight > headerMaxHeight {
            headerHeightConstraint.constant = headerMaxHeight
        } else if newHeaderHeight < headerMinHeight {
            headerHeightConstraint.constant = headerMinHeight
        } else {
            headerHeightConstraint.constant = newHeaderHeight
            scrollView.contentOffset.y = 0
        }
        
        print(yPosition)
        
    }
}

