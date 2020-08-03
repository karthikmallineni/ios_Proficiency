//
//  DataBinding.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import Foundation

class DataBinding<T> {
    
    private var bindHandler:((T) -> ())?
    var value:T{
        didSet{
            bindHandler?(value)
        }
    }
    
    init(_ value:T) {
        self.value = value
    }
    
    func bind(_ listener:((T) -> ())?)  {
        self.bindHandler = listener
        listener?(value)
    }
    
}
