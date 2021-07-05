//
//  ViewController.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 05/07/2021.
//

import UIKit

class AddFoodViewController: UIViewController {

    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink // Change it later
        return image
    }()
    
    private let descriptionFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Add description to the photo"
        label.textColor = .lightGray
        return label
    }()
    
    private let descriptionField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.text = "Some text"
        return textField
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: CGFloat(66.0/255.0), green: CGFloat(133.0/255.0), blue: CGFloat(244.0/255.0), alpha: 1)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Setting the foot image's view
        view.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        foodImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 20.0).isActive = true
        foodImage.addConstraint(NSLayoutConstraint(item: foodImage, attribute: .height, relatedBy: .equal, toItem: foodImage, attribute: .width, multiplier: 1.0, constant: 0.0))
        
        
        // Setting the label for the description text field
        view.addSubview(descriptionFieldLabel)
        descriptionFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionFieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        descriptionFieldLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 20.0).isActive = true
        
        // Setting the description text field
        view.addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20.0).isActive = true
        descriptionField.topAnchor.constraint(equalTo: descriptionFieldLabel.bottomAnchor, constant: 20.0).isActive = true
        
        // Setting the button
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        doneButton.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 20.0).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }


}

