//
//  Network.swift
//  CollectionView Task
//
//  Created by Admin on 7/21/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CodableFirebase

class Network{
    var window: UIWindow?

    struct Singleton {
        static let sharedInstance = Network()
    }
    
    class var sharedInstance: Network {
        return Singleton.sharedInstance
    }
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    func fetchData(_ childName: String,completion: @escaping (Movie?, Error?) -> Void){
        if Reachability.isConnectedToNetwork() == true{
            if !childName.isEmpty{
                ref = Database.database().reference()
                databaseHandle = ref?.child(childName).observe(.childAdded, with: { (snapshot) in
                    guard let value = snapshot.value else { return }
                    do {
                        let posts = try FirebaseDecoder().decode(Movie.self, from: value)
                        completion(posts,nil)
                    } catch let error {
                        print(error)
                        completion(nil,error)
                    }
                })
            }else{
                print("No Data")
                completion(nil,NSError(domain: "dataNilError", code: -105, userInfo: nil))
            }
        }else{
            showAlert(targetVC: (UIApplication.shared.keyWindow?.rootViewController)!, title: "", message: noInternetMessage)
        }
    }
}
