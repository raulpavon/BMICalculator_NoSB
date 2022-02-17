//
//  GlobalConstants.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 16/02/22.
//

import Foundation

struct GlobalConstants {
    enum BMICalculator {
        static let lbCalculateTitle = "CALCULATE YOUR BMI"
        static let lbHeightTitle = "Height"
        static let lbHeightValue = "1.50m"
        static let lbWeightTitle = "Weight"
        static let lbWeightValue = "100Kg"
        static let btCalculateTitle = "CALCULATE"
        static let lbResultTitle = "YOUR RESULT"
        static let btRecalculateTitle = "RECALCULATE"
        enum Advise {
            static let under = "Eat more pies!"
            static let over = "Eat less pies!"
            static let fit = "Fit as a fiddle!"
        }
    }
    enum Images {
        static let bmiBackgrond = "calculate_background"
        static let resultBackground = "result_background"
    }
    enum Colors {
        static let white = "FFFFFF"
        static let blue = "62609D"
        static let darkBlue = "7472D2"
    }
}
