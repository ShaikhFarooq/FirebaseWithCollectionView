//
//  MovieViewController.swift
//  CollectionView Task
//
//  Created by Admin on 7/16/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    // MARK: - Properties
    var movieList = [Movie]()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieData()
        mCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        mCollectionView?.collectionViewLayout = InvertedCollectionViewFlowLayout()
    }
    
    // MARK: - Fetch Data From Firebase Database
    func fetchMovieData(){
        showLoadingIndicator()
        Network.sharedInstance.fetchData("movies"){(result, error) in
            if let result = result {
                print("success: \(result)")
                self.movieList.append(result)
            }else if let error = error {
                self.stopLoadingIndicator()
                print("error: \(error.localizedDescription)")
                showAlert(targetVC: self, title: "", message: error.localizedDescription)
            }
            
            if self.movieList.count > 0{
                print(self.movieList)
                self.stopLoadingIndicator()
                self.reloadData()
            }else{
                self.stopLoadingIndicator()
                showAlert(targetVC: self, title: "", message: "No movies to show at this time.")
            }
        }
    }
    
    // MARK: - Helper Methods
    private func showLoadingIndicator(){
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
    }
    
    private func stopLoadingIndicator(){
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
    
    private func reloadData(){
        DispatchQueue.main.async(execute: {
            self.mCollectionView.reloadData()
        })
    }
}

// MARK: - Collectionview DataSource Methods
extension MovieViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        movieCell.layer.cornerRadius = 10
        
        if movieList.count > 0 {
            movieCell.setData(movie: movieList[indexPath.row])
        }
        return movieCell
    }
}

// MARK: - Collectionview Flow Layout Methods
extension MovieViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let approximateWidthOfContent = view.frame.width/2 - 20
        let size = CGSize(width: approximateWidthOfContent, height: 150)
        return size
    }
}


