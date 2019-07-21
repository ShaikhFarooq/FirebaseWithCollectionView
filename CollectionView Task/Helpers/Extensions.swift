//
//  Extensions.swift
//  CollectionView Task
//
//  Created by Admin on 7/21/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func getRandomColor() -> UIColor {
        let colors = [UIColor.red, UIColor.green, UIColor.blue]
        let randomNumber = arc4random_uniform(UInt32(colors.count))
        
        return colors[Int(randomNumber)]
    }
    
}
