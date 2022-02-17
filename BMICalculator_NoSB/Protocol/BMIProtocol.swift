//
//  BMIProtocol.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 16/02/22.
//

import Foundation
import UIKit

protocol BMIView: AnyObject {
    func goToResult(bmiValue: String, advise: String, color: UIColor)
}
