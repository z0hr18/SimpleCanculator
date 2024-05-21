//
//  FirstVC.swift
//  SimpleCalculator
//
//  Created by Zohra Guliyeva  on 19.05.24.
//

import UIKit

class FirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
    }
    
    private var textfieldOne: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "First number..."
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private var textfieldTwo: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Second number..."
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    
    private lazy var buttonCalculatePostive: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(sumButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonCalculateNegative: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    }()
    
    func configureUI() {
        [textfieldOne,
         textfieldTwo,
         buttonCalculatePostive,
         buttonCalculateNegative,
         resultLabel,].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            textfieldOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 40),
            textfieldOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfieldOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            textfieldTwo.topAnchor.constraint(equalTo: textfieldOne.bottomAnchor , constant: 15),
            textfieldTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfieldTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            buttonCalculatePostive.topAnchor.constraint(equalTo: textfieldTwo.bottomAnchor, constant: 20),
            buttonCalculatePostive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            buttonCalculatePostive.widthAnchor.constraint(equalToConstant: 24),
            buttonCalculatePostive.heightAnchor.constraint(equalToConstant: 24),
            
            buttonCalculateNegative.topAnchor.constraint(equalTo: textfieldTwo.bottomAnchor, constant: 20),
            buttonCalculateNegative.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            buttonCalculateNegative.widthAnchor.constraint(equalToConstant: 24),
            buttonCalculateNegative.heightAnchor.constraint(equalToConstant: 24),
            
            resultLabel.topAnchor.constraint(equalTo: textfieldTwo.bottomAnchor, constant: 70),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 170),
            resultLabel.widthAnchor.constraint(equalToConstant: 50),
            resultLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func sumButtonTapped() {
        //        let firstNumber = Int(textfieldOne.text!)!
        //        let secondNumber = Int(textfieldTwo.text!)!
        //        let result = firstNumber + secondNumber
        //        resultLabel.text = String(result)
        
        if let firstNumber = Int(textfieldOne.text!) {
            if let secondNumber = Int(textfieldTwo.text!) {
                let result = firstNumber + secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
    @objc func minusButtonTapped() {
        if let firstNumber = Int(textfieldOne.text!) {
            if let secondNumber = Int(textfieldTwo.text!) {
                let result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
}

