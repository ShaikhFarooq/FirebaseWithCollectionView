//
//  MovieCollectionViewCell.swift
//  CollectionView Task
//
//  Created by Admin on 7/16/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
  
     // MARK: - Properties
    let ratingsDisplay = [
        "☆☆☆☆☆",
        "★☆☆☆☆",
        "★★☆☆☆",
        "★★★☆☆",
        "★★★★☆",
        "★★★★★"
    ]

     // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
     // MARK: - Binding Data To UI
    func setData(movie: Movie){
        nameLbl.text = movie.title + "(" + movie.year + ")"
        genreLbl.text = movie.genre
        ratingLbl.text = ratingsDisplay[movie.rating]
    }
}
