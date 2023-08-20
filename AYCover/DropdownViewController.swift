//
//  DropdownViewController.swift
//  AYCover
//
//  Created by andy on 2023/8/16.
//

import UIKit

class DropdownViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let items = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    let dropdownButton = UIButton()
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        dropdownButton.setTitle("Select an option", for: .normal)
        dropdownButton.setTitleColor(.black, for: .normal)
        dropdownButton.addTarget(self, action: #selector(showDropdown), for: .touchUpInside)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
        
        view.addSubview(dropdownButton)
        view.addSubview(pickerView)
        pickerView.backgroundColor = UIColor.red
        // Set layout constraints
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dropdownButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropdownButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pickerView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 10),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func showDropdown() {
        pickerView.isHidden = !pickerView.isHidden
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dropdownButton.setTitle(items[row], for: .normal)
        pickerView.isHidden = true
    }
}
