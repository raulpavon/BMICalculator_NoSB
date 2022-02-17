//
//  BMIFactory.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation
import UIKit

protocol BMIFactory {
    func makeBMIViewController(bmiCoordinator: BMICoordinator) -> BMIViewController
    func makeResultViewController(bmiValue: String, advise: String, color: UIColor) -> ResultViewController
}

class BMIFactoryImp: BMIFactory {
    func makeBMIViewController(bmiCoordinator: BMICoordinator) -> BMIViewController {
        let bmiViewController = BMIViewController(factory: self, bmiCoordinator: bmiCoordinator)
        return bmiViewController
    }
    
    func makeResultViewController(bmiValue: String, advise: String, color: UIColor) -> ResultViewController {
        let resultViewController = ResultViewController(bmiValue: bmiValue, advise: advise, color: color)
        return resultViewController
    }
}
