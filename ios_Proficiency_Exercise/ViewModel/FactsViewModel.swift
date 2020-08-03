//
//  FactsViewModel.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

class FactsViewModel {
    var title :DataBinding<String?> = DataBinding(nil)
    var reloadView:DataBinding<Bool> = DataBinding(false)
    var error : DataBinding<Error?> = DataBinding(nil)
    var rows:[Rows] = []
    private var tableViewDatasource = FactsDataSourceModel()
    
    func getDatasource() -> FactsDataSourceModel {
        return self.tableViewDatasource
    }
    
    
    init() {
        self.getFactsDataSource()
    }
    
    // get image url
    func getImageUrl(_ indexPath:IndexPath) -> URL?{
        if indexPath.row < self.rows.count {
            if let imageHref = self.rows[indexPath.row].imageHref{
                return URL(string: imageHref)
            }
            return nil
        }
        return nil
    }
    
    
    // fetch Phots from API
    func getFactsDataSource() {
        ServiceManager.sharedInstance.getFacts { (result) in
            switch result {
            case .success(let facts):
                self.title.value = facts.title
                self.rows = facts.rows
                self.tableViewDatasource.updateRows(self.rows.map({ RowViewModel($0)}))
                self.reloadView.value = true
            case .failure(let error): self.error.value = error
            }
        }
    }
    
    func updateRowImage(_ image:UIImage?, row:Int) -> Bool{
        return self.tableViewDatasource.updateRowImage(image, forRow: row)
    }
}
