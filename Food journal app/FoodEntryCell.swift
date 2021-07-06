//
//  FoodEntryCell.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class FoodEntryCell: UITableViewCell {

    let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        return image
    }()
    
    let foodDescription: UILabel = {
        let description = UILabel()
        description.textColor = .black
        description.numberOfLines = 0
        return description
    }()
    
    let entryDate: UILabel = {
        let date = UILabel()
        date.textColor = .lightGray
        return date
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
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
        foodDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.0).isActive = true
        foodDescription.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 20.0).isActive = true
        foodDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        
        // Setting the date
        contentView.addSubview(entryDate)
        entryDate.translatesAutoresizingMaskIntoConstraints = false
        entryDate.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 20.0).isActive = true
        entryDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        entryDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
