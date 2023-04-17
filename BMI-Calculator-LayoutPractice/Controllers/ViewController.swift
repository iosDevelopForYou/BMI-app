//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Marat Guseynov on 14.04.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let resultVC = ResultViewController()
    
    var heigth: Float = 0.0
    var weigth: Float = 0.0
    
    var calculatorBrain = CalculatorBrain()
    
    private let backgroundImage: UIImageView = {
        let back = UIImageView()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.image = UIImage(named: "calculate_background")
        back.clipsToBounds = true
        back.contentMode = .scaleAspectFill
        return back
    }()
    
    private let calculateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CALCULATE YOUR BMI"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 50, y: 50, width: 200, height: 20))
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 2.2
        slider.value = 1.5
        slider.isContinuous = true
        slider.tintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099)
        slider.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099)
        slider.addTarget(self, action: #selector(heightSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 50, y: 50, width: 200, height: 20))
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.value = 50
        slider.isContinuous = true
        slider.tintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099)
        slider.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099)
        slider.addTarget(self, action: #selector(weightSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
        button.isHighlighted = false
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        button.isSelected = true
        return button
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let heighValuetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "1.5 m"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let weightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100 kg"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    @objc func heightSliderValueChanged(_ sender: UISlider) {
        heighValuetLabel.text = String(format: "%.2f m", sender.value)
        heigth = sender.value
    }
    
    @objc func weightSliderValueChanged(_ sender: UISlider) {
        weightValueLabel.text = String(format: "%.0f kg", sender.value)
        weigth = sender.value
    }
    
    @objc func calculateButtonPressed(_ sender: UIButton) {
       
        calculatorBrain.calculateBmi(heigth: heigth, weigth: weigth)
           resultVC.bmiValue = calculatorBrain.getBmiValue()
           calculatorBrain.resetBmi()
           resultVC.calculatorBrain = calculatorBrain
           navigationController?.present(resultVC, animated: true)
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
              sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
          }
        
       
    
    }
    
    func addViewLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(calculateLabel)
        view.addSubview(heightSlider)
        view.addSubview(weightSlider)
        view.addSubview(calculateButton)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(heighValuetLabel)
        view.addSubview(weightValueLabel)
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            calculateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 190),
            calculateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            calculateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            heighValuetLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -5),
            heighValuetLabel.trailingAnchor.constraint(equalTo: heightSlider.trailingAnchor),
            
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -5),
            heightLabel.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor),
            
            heightSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -190),
            heightSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            heightSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            weightValueLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -5),
            weightValueLabel.trailingAnchor.constraint(equalTo: weightSlider.trailingAnchor),
            
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -5),
            weightLabel.leadingAnchor.constraint(equalTo: weightSlider.leadingAnchor),
            
            weightSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -130),
            weightSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            weightSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            calculateButton.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            calculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewLayout()
    }
}

