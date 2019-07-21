//
//  Utilities.swift
//  CollectionView Task
//
//  Created by Admin on 7/21/19.
//  Copyright © 2019 Farooq. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

open class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}


func showAlert(
    targetVC: UIViewController,
    title: String,
    message: String){
    let alert = UIAlertController(
        title: title,
        message: message,
        preferredStyle: UIAlertController.Style.alert)
    let okButton = UIAlertAction(
        title:"OK",
        style: UIAlertAction.Style.default,
        handler:
        {
            (alert: UIAlertAction!)  in
    })
    alert.addAction(okButton)
    targetVC.present(alert, animated: true, completion: nil)
}
