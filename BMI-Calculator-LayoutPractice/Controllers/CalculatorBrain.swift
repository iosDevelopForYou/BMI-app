//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Marat Guseynov on 16.04.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
   
    var bmi: Float = 0.0
    
    mutating func calculateBmi(heigth: Float, weigth: Float) {
        bmi = weigth / (heigth * heigth)
    }
    mutating func resetBmi() {
          bmi = 0.0
      }
    func getBmiValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        return bmiTo1DecimalPlace
    }
    
   
}
