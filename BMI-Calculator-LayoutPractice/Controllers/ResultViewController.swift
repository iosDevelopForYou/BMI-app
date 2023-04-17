//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Marat Guseynov on 14.04.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    
    private let yourResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YOUR RESULT"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
     let bmiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19.5"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let eatMoreSnacksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EAT SOME MORE SNACKS!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let backgroundImage: UIImageView = {
        let back = UIImageView()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.image = UIImage(named: "result_background")
        back.clipsToBounds = true
        back.contentMode = .scaleAspectFill
        return back
    }()
    
    private lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1), for: .normal) 
        button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
        sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
              sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
          }
    }
    
   private func addViewLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(recalculateButton)
       view.addSubview(yourResultLabel)
       view.addSubview(bmiLabel)
       view.addSubview(eatMoreSnacksLabel)
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            
            yourResultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            yourResultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            bmiLabel.topAnchor.constraint(equalTo: yourResultLabel.bottomAnchor, constant: 5),
            bmiLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            eatMoreSnacksLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 5),
            eatMoreSnacksLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
     
            
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bmiLabel.text = bmiValue ?? "0.0"
    }
    
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.20334813, green: 0.4806935787, blue: 0.7710453272, alpha: 1)
        addViewLayout()
        
        bmiLabel.text = bmiValue
        calculatorBrain.calculateBmi(heigth: 0, weigth: 0)
      
    }
}
