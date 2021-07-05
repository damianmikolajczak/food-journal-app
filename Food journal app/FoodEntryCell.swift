//
//  FoodEntryCell.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class FoodEntryCell: UITableViewCell {

    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        return image
    }()
    
    private let foodDescription: UILabel = {
        let description = UILabel()
        description.text = "Some text description"
        return description
    }()
    
    private let entryDate: UILabel = {
        let date = UILabel()
        date.textColor = .lightGray
        date.text = "Jul 7 2021 "
        return date
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        // Setting the image
        contentView.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        foodImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        foodImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        foodImage.addConstraint(NSLayoutConstraint(item: foodImage, attribute: .width, relatedBy: .equal, toItem: foodImage, attribute: .height, multiplier: 1.0, constant: 0))
        
        // Setting the description
        contentView.addSubview(foodDescription)
        foodDescription.translatesAutoresizingMaskIntoConstraints = false
        foodDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        foodDescription.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 10.0).isActive = true
        foodDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        
        // Setting the date
        contentView.addSubview(entryDate)
        entryDate.translatesAutoresizingMaskIntoConstraints = false
        entryDate.topAnchor.constraint(equalTo: foodDescription.topAnchor, constant: 10.0).isActive = true
        entryDate.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 10.0).isActive = true
        entryDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
