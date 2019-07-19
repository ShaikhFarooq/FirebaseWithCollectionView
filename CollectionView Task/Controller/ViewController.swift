//
//  ViewController.swift
//  CollectionView Task
//
//  Created by Admin on 7/16/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    let movieNames = ["Avatar (2009)","2","3","4","5","Avatar (2009)","2","3","4","5"]
    let ratingsDisplay = [
        "★☆☆☆☆",
        "★★☆☆☆",
        "★★★☆☆",
        "★★★★☆",
        "★★★★★"
    ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        let rating = 4
//        let label = UILabel()
//        label.text = ratingsDisplay[rating - 1]
        mCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        mCollectionView?.collectionViewLayout = InvertedCollectionViewFlowLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setData(movieName: movieNames[indexPath.row])
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
    
}


class InvertedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = super.layoutAttributesForItem(at: indexPath)
        attrs?.transform = CGAffineTransform(scaleX: 1, y: -1)
        return attrs
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrsList = super.layoutAttributesForElements(in: rect)
        if let list = attrsList {
            for i in 0..<list.count {
                list[i].transform = CGAffineTransform(scaleX: 1, y: -1)
            }
        }
        return attrsList
    }
}
