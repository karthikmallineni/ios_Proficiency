//
//  Extension.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//


import UIKit

extension UIDevice{
    func isIPAD() -> Bool{
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        return false
    }
    
}

extension UITableViewCell{
    class var reuseIdentifier:String{
        return "\(self)"
    }
}
