//
//  ResultUIView.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 16/02/22.
//

import UIKit

class ResultUIView: UIView {
    enum ResultUIViewConstraints {
        enum LbResult {
            static let fontSize: CGFloat = 35
        }
        enum LbResultValue {
            static let fontSize: CGFloat = 80
        }
        enum LbAdvise {
            static let fontSize: CGFloat = 20
        }
        enum BtRecalculate {
            static let fontSize: CGFloat = 20
            static let height: CGFloat = 51
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let bottom: CGFloat = -20
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgBackground: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.resultBackground))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        return stack
    }()
    
    private let lbResult: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: ResultUIViewConstraints.LbResult.fontSize)
        label.textColor = .white
        label.text = GlobalConstants.BMICalculator.lbResultTitle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbResultValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: ResultUIViewConstraints.LbResultValue.fontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbAdvise: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: ResultUIViewConstraints.LbAdvise.fontSize, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var btRecalculate: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.BMICalculator.btRecalculateTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: ResultUIViewConstraints.BtRecalculate.fontSize)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(hex: GlobalConstants.Colors.darkBlue), for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgBackground)
        mainContainer.addSubview(stackContainer)
        stackContainer.addArrangedSubview(lbResult)
        stackContainer.addArrangedSubview(lbResultValue)
        stackContainer.addArrangedSubview(lbAdvise)
        mainContainer.addSubview(btRecalculate)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgBackground.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            imgBackground.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            imgBackground.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            
            stackContainer.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor),
            stackContainer.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            
            btRecalculate.heightAnchor.constraint(equalToConstant: ResultUIViewConstraints.BtRecalculate.height),
            btRecalculate.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: ResultUIViewConstraints.BtRecalculate.leading),
            btRecalculate.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: ResultUIViewConstraints.BtRecalculate.trailing),
            btRecalculate.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: ResultUIViewConstraints.BtRecalculate.bottom),
        ])
    }
    
    func updateUI(bmiValue: String, advise: String, color: UIColor) {
        lbResultValue.text = bmiValue
        lbAdvise.text = advise
        backgroundColor = color
    }
    
    func setBtTarget(target: Any?, action: Selector) {
        btRecalculate.addTarget(target, action: action, for: .touchUpInside)
    }
}
