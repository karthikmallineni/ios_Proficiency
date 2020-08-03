//
//  FactsListTableViewCell.swift
//  ios_Proficiency_Exercise
//
//  Created by Karthik on 02/08/20.
//  Copyright © 2020 Administrator. All rights reserved.
//

import UIKit

class FactsListTableViewCell: UITableViewCell {
    
     let padding:CGFloat = 8
    
    class var CellSize:CGSize
    {
        
        
        var width = UIScreen.main.bounds.width - 40
        if UIDevice.current.isIPAD(){
            width = width/2
        }
        return CGSize(width: width, height: 300)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private var factListTitle:UILabel!
    private var factListDesc:UILabel!
    private var factListImage:UIImageView!
    
    
    var title:UILabel{
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.textColor = UIColor.black
        return label
    }
    
    var desc:UILabel{
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.lineBreakMode = .byWordWrapping
        label.clipsToBounds = true
        return label
    }
    
    var imageV:UIImageView{
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBaseUI()
    }
    
    
    
    func setupBaseUI() {
        
        factListTitle = title
        factListDesc = desc
        factListImage = imageV
        
        factListTitle.translatesAutoresizingMaskIntoConstraints = false
        factListDesc.translatesAutoresizingMaskIntoConstraints = false
        factListImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(factListTitle)
        self.contentView.addSubview(factListDesc)
        self.contentView.addSubview(factListImage)
        
        self.setupConstriants()
        
    }
    
    
    
     func setupConstriants() {
    
        NSLayoutConstraint.activate([
            self.factListImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            self.factListImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.factListImage.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: padding),
            self.factListImage.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -padding),
            self.factListImage.widthAnchor.constraint(equalToConstant: FactsListTableViewCell.CellSize.width),
            self.factListTitle.topAnchor.constraint(greaterThanOrEqualTo: factListImage.bottomAnchor, constant: padding),
            self.factListTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            self.factListTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            self.factListTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            self.factListDesc.topAnchor.constraint(equalTo: factListTitle.bottomAnchor, constant: padding),
            self.factListDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding ),
            self.factListDesc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            self.factListDesc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            self.factListDesc.heightAnchor.constraint(lessThanOrEqualToConstant: 60)
            ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ viewModel:RowViewModel){
        factListImage.image = viewModel.image
        factListTitle.text = viewModel.title
        factListDesc.text = viewModel.desc
    }
    
}


