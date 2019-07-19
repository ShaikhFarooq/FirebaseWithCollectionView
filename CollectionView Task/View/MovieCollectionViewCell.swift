//
//  MovieCollectionViewCell.swift
//  CollectionView Task
//
//  Created by Admin on 7/16/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(movieName: String){
        nameLbl.text = movieName
    }
    
}
