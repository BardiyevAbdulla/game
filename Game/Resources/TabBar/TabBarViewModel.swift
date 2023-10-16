//
//  TabBarViewModel.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import Foundation
import UIKit



class TabBarViewModel {
     let space: CGFloat = 10
     var count: CGFloat = 3
    
    lazy var sizeOfItem = calculateSize()
    
    func calculateSize() -> CGFloat {
        let allSpace = (count + 1) * space
        
        let value = (windowWidth - allSpace ) / count
        return value
    }
    
    func reload() {
        switch windowWidth {
        case 350 ..< 450: count = 3
        case  450 ..< 670: count = 4
        case 670 ..< 890: count = 5
        case 890 ..< 1090: count = 6
        default: count = 7
        }
        sizeOfItem = calculateSize()
    }
    
    
    
}
