//
//  TotalBillViewController.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 16.02.2025.
//

import UIKit

class TotalBillView: UIView {
    
    //заголовок для View (второй заголовок внутри экрана MainViewController)
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Всего по чеку"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Arial", size: 14)
     
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Текстовое поле ввода суммы по чеку
    let summTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        element.layer.cornerRadius = 10
        element.textColor = .black
        element.font = UIFont(name: "Arial", size: 48)
        element.textAlignment = .center
        element.keyboardType = .numberPad   //клавиатура без букв (с компа мы можем ввести все что угодно)

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(summTextField)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            //Надпись Сумма по чеку
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            //центр по оси Х должен совпадать с центром по оси Х родительского view
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            //Поле для ввода суммы по чеку
            summTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            summTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            summTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            summTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
