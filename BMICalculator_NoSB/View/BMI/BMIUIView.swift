//
//  BMIUIView.swift
//  BMICalculator_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import UIKit

protocol BMIUIViewDelegate: AnyObject {
    func calculate(height: Float, weight: Float)
}

class BMIUIView: UIView {
    enum BMIUIViewConstraints {
        enum LbCalculate {
            static let fonSize: CGFloat = 40
        }
        enum LbHeight {
            static let fontSize: CGFloat = 17
        }
        enum SliderHeight {
            static let value: Float = 1.5
            static let minValue: Float = 0
            static let maxValue: Float = 3
            static let height: CGFloat = 60
        }
        enum LbWeight {
            static let fontSize: CGFloat = 17
        }
        enum SliderWeight {
            static let value: Float = 100
            static let minValue: Float = 0
            static let maxValue: Float = 200
            static let height: CGFloat = 60
        }
        enum BtCalculate {
            static let fontSize: CGFloat = 20
            static let height: CGFloat = 51
        }
        enum StackContainer {
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let bottom: CGFloat = -20
        }
        enum Stacks {
            static let height: CGFloat = 21
        }
    }
    
    weak var delegate: BMIUIViewDelegate?
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgBackground: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.bmiBackgrond))
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
    
    private let lbCalculate: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: BMIUIViewConstraints.LbCalculate.fonSize)
        label.textColor = .darkGray
        label.text = GlobalConstants.BMICalculator.lbCalculateTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var stackHeight: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let lbHeight: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: BMIUIViewConstraints.LbHeight.fontSize, weight: .light)
        label.textColor = .darkGray
        label.text = GlobalConstants.BMICalculator.lbHeightTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbHeightValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: BMIUIViewConstraints.LbHeight.fontSize, weight: .light)
        label.textColor = .darkGray
        label.text = GlobalConstants.BMICalculator.lbHeightValue
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var sliderHeigth: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.value = BMIUIViewConstraints.SliderHeight.value
        slider.minimumValue = BMIUIViewConstraints.SliderHeight.minValue
        slider.maximumValue = BMIUIViewConstraints.SliderHeight.maxValue
        slider.contentMode = .scaleToFill
        return slider
    }()
    
    private lazy var stackWeigth: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let lbWeigth: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: BMIUIViewConstraints.LbWeight.fontSize, weight: .light)
        label.textColor = .darkGray
        label.text = GlobalConstants.BMICalculator.lbWeightTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbWeigthValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: BMIUIViewConstraints.LbWeight.fontSize, weight: .light)
        label.textColor = .darkGray
        label.text = GlobalConstants.BMICalculator.lbWeightValue
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var sliderWeigth: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.value = BMIUIViewConstraints.SliderWeight.value
        slider.minimumValue = BMIUIViewConstraints.SliderWeight.minValue
        slider.maximumValue = BMIUIViewConstraints.SliderWeight.maxValue
        slider.contentMode = .scaleToFill
        return slider
    }()
    
    private lazy var btCalculate: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.BMICalculator.btCalculateTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: BMIUIViewConstraints.BtCalculate.fontSize)
        button.backgroundColor = UIColor(hex: GlobalConstants.Colors.blue)
        button.setTitleColor(UIColor(hex: GlobalConstants.Colors.white), for: .normal)
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
        stackContainer.addArrangedSubview(lbCalculate)
        stackContainer.addArrangedSubview(stackHeight)
        stackHeight.addArrangedSubview(lbHeight)
        stackHeight.addArrangedSubview(lbHeightValue)
        stackContainer.addArrangedSubview(sliderHeigth)
        stackContainer.addArrangedSubview(stackWeigth)
        stackWeigth.addArrangedSubview(lbWeigth)
        stackWeigth.addArrangedSubview(lbWeigthValue)
        stackContainer.addArrangedSubview(sliderWeigth)
        stackContainer.addArrangedSubview(btCalculate)
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
            
            stackContainer.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: BMIUIViewConstraints.StackContainer.leading),
            stackContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: BMIUIViewConstraints.StackContainer.trailing),
            stackContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: BMIUIViewConstraints.StackContainer.bottom),
            
            stackHeight.heightAnchor.constraint(equalToConstant: BMIUIViewConstraints.Stacks.height),
            
            stackWeigth.heightAnchor.constraint(equalToConstant: BMIUIViewConstraints.Stacks.height),
            
            sliderHeigth.heightAnchor.constraint(equalToConstant: BMIUIViewConstraints.SliderHeight.height),
            
            sliderWeigth.heightAnchor.constraint(equalToConstant: BMIUIViewConstraints.SliderWeight.height),
            
            btCalculate.heightAnchor.constraint(equalToConstant: BMIUIViewConstraints.BtCalculate.height),
        ])
    }
    
    func setSliderHeightTarget(target: Any?, action: Selector) {
        sliderHeigth.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setSliderWeightTarget(target: Any?, action: Selector) {
        sliderWeigth.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setBtTarget(target: Any?, action: Selector) {
        btCalculate.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func heightSliderChanged() {
        lbHeightValue.text = "\(String(format: "%.2f", sliderHeigth.value))m"
    }
    
    func weightSliderChanged() {
        lbWeigthValue.text = "\(Int(sliderWeigth.value))kg"
    }
    
    func calculatePressed() {
        delegate?.calculate(height: sliderHeigth.value, weight: sliderWeigth.value)
    }
}
