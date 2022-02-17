//
//  BMIManager.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation
import UIKit

struct BMIManager {
    
    var bmi: BMI?
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advise: GlobalConstants.BMICalculator.Advise.under, color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            //bmi = BMI(value: bmiValue, advise: "Eat more pies!", color: .blue)
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advise: GlobalConstants.BMICalculator.Advise.over, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            //bmi = BMI(value: bmiValue, advise: "Eat more pies!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advise: GlobalConstants.BMICalculator.Advise.fit, color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
            //bmi = BMI(value: bmiValue, advise: "Eat more pies!", color: .systemPink)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvise() -> String {
        return bmi?.advise ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //return bmi?.color ?? .systemPink
    }
}
