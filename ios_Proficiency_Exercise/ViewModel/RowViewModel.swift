//
//  RowViewModel.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

class RowViewModel {
    
    var title:String?
    var desc:String?
    var image:UIImage? = UIImage(named: "placeholder")
    
    init(_ row:Rows) {
        self.title = row.title
        self.desc = row.description
    }
    
    func updateImage(_ image:UIImage?){
        self.image = image
    }
    
}
