//
//  FoodEntryDetailViewController.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 06/07/2021.
//

import UIKit

class FoodEntryDetailViewController: UIViewController {

    let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray // Change it later
        
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.textColor = .lightGray
        return label
    }()
    
    let entryDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Setting the navigation bar
        self.navigationItem.title = "Food entry"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        
        // Setting the foot image's view
        view.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30.0).isActive = true
        foodImage.addConstraint(NSLayoutConstraint(item: foodImage, attribute: .height, relatedBy: .equal, toItem: foodImage, attribute: .width, multiplier: 1.0, constant: 0.0))
        
        // Setting the label for the description text field
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 30.0).isActive = true
        
        // Setting the description text
        view.addSubview(entryDescription)
        entryDescription.translatesAutoresizingMaskIntoConstraints = false
        entryDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        entryDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30.0).isActive = true
        entryDescription.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10.0).isActive = true
        
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
