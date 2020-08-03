//
//  FactsDataSourceModel.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

class FactsDataSourceModel: NSObject, UITableViewDataSource {
    
    private var rows:[RowViewModel] = []
    
    func updateRows(_ rows:[RowViewModel]){
        self.rows = rows
    }
    
    func updateRowImage(_ image:UIImage?, forRow row:Int) -> Bool{
        let item = self.rows[row]
        if item.image == UIImage(named: "placeholder"){
            item.updateImage(image)
            return true
        }
        return false
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FactsListTableViewCell.reuseIdentifier, for: indexPath) as! FactsListTableViewCell
        cell.configure(rows[indexPath.row])
        return cell
    }
    
    
    
}
