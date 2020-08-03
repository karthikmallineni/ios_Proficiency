//
//  FactsModel.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

struct Facts:Decodable {
    var title:String
    var rows:[Rows]
}

struct Rows:Decodable {
    var title:String?
    var description:String?
    var imageHref:String?
}
