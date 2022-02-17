//
//  BMICoordinator.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation
import UIKit

class BMICoordinator {
    var navigationController: UINavigationController
    private let factory = BMIFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let bmiViewController = factory.makeBMIViewController(bmiCoordinator: self)
        navigationController.setViewControllers([bmiViewController], animated: false)
    }
    
    func openResult(bmiValue: String, advise: String, color: UIColor) {
        let resultViewController = factory.makeResultViewController(bmiValue: bmiValue, advise: advise, color: color)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}
