//
//  ResultViewController.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 16/02/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String
    var advise: String
    var color: UIColor
    
    private lazy var resultUIView: ResultUIView = {
        let view = ResultUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(bmiValue: String, advise: String, color: UIColor) {
        self.bmiValue = bmiValue
        self.advise = advise
        self.color = color
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
        resultUIView.updateUI(bmiValue: bmiValue, advise: advise, color: color)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTarget()
    }

    private func addComponents() {
        view.addSubview(resultUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            resultUIView.topAnchor.constraint(equalTo: view.topAnchor),
            resultUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setTarget() {
        resultUIView.setBtTarget(target: self, action: #selector(recalculate))
    }
    
    @objc private func recalculate() {
        navigationController?.popToRootViewController(animated: true)
    }
}
