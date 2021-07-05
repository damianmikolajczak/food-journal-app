//
//  ViewController.swift
//  Food journal app
//
//  Created by Damian Mikołajczak on 05/07/2021.
//

import UIKit

class AddFoodViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray // Change it later
        
        return image
    }()
    
    private let descriptionFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Add some description below"
        label.textColor = .lightGray
        return label
    }()
    
    private let descriptionField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Describe your food"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
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
        addHiddingKeyboard()
        
        // Setting the navigation bar
        self.navigationItem.title = "Food entry"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(takePhoto))
        
        // Setting the foot image's view
        view.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30.0).isActive = true
        foodImage.addConstraint(NSLayoutConstraint(item: foodImage, attribute: .height, relatedBy: .equal, toItem: foodImage, attribute: .width, multiplier: 1.0, constant: 0.0))
        
        
        // Setting the label for the description text field
        view.addSubview(descriptionFieldLabel)
        descriptionFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionFieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        descriptionFieldLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 30.0).isActive = true
        
        // Setting the description text field
        view.addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30.0).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30.0).isActive = true
        descriptionField.topAnchor.constraint(equalTo: descriptionFieldLabel.bottomAnchor, constant: 15.0).isActive = true
        
        // Setting the button
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.addTarget(self, action: #selector(addFoodJournal), for: .touchUpInside)
        
    }

    @objc func addFoodJournal() {
        guard let _ = foodImage.image, let _ = descriptionField.text else { return }
        
    }
    
    @objc func takePhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .camera
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true, completion: nil)
    }
}

extension AddFoodViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.editedImage] as? UIImage else { return }
        
        self.foodImage.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddFoodViewController {
    func addHiddingKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

