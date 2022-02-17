//
//  BMIViewController.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import UIKit

class BMIViewController: UIViewController {
    
    weak var bmiCoordinator: BMICoordinator?
    private let factory: BMIFactory
    var bmiManager = BMIManager()
    var bmiValue: String?
    var advise: String?
    var color: UIColor?
    
    private lazy var bmiUIView: BMIUIView = {
        let view = BMIUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    required init(factory: BMIFactory, bmiCoordinator: BMICoordinator) {
        self.factory = factory
        self.bmiCoordinator = bmiCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTargets()
    }
    
    private func addComponents() {
        view.addSubview(bmiUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            bmiUIView.topAnchor.constraint(equalTo: view.topAnchor),
            bmiUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bmiUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bmiUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setTargets() {
        bmiUIView.setSliderHeightTarget(target: self, action: #selector(heightSliderChanged))
        bmiUIView.setSliderWeightTarget(target: self, action: #selector(weightSliderChanged))
        bmiUIView.setBtTarget(target: self, action: #selector(calculatePressed))
    }
    
    @objc private func heightSliderChanged() {
        bmiUIView.heightSliderChanged()
    }
    
    @objc private func weightSliderChanged() {
        bmiUIView.weightSliderChanged()
    }
    
    @objc func calculatePressed() {
        bmiUIView.calculatePressed()
    }
}

extension BMIViewController: BMIUIViewDelegate {
    func calculate(height: Float, weight: Float) {
        bmiManager.calculateBMI(weight: weight, height: height)
        bmiValue = bmiManager.getBMIValue()
        advise = bmiManager.getAdvise()
        color = bmiManager.getColor()
        goToResult(bmiValue: bmiValue ?? "", advise: advise ?? "", color: color ?? UIColor())
    }
}

extension BMIViewController: BMIView {
    func goToResult(bmiValue: String, advise: String, color: UIColor) {
        bmiCoordinator?.openResult(bmiValue: bmiValue, advise: advise, color: color)
    }
}
