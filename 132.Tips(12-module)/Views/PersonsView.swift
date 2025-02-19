//
//  TotalBillViewController.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 16.02.2025.
//

import UIKit

class PersonsView: UIView {
    
    //заголовок для View (второй заголовок внутри экрана MainViewController)
    let titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Количество персон"
        element.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        element.font = UIFont(name: "Arial", size: 14)
     
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //фон для вью - вью, в котором поместим кнопки - и +, а также надписи с количеством персон
    let backgroundGrayView: UIView = {
        let element = UIView()
        element.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
   }()
    
    
    lazy var minusButton: UIButton = {
        let element = UIButton(type: .system)   //иниализатор, чтобы кнопка щелкала красива
        element.setTitle("-", for: .normal)
        element.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        element.titleLabel?.font = UIFont(name: "Arial", size: 60)
        element.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var plusButton: UIButton = {
        let element = UIButton(type: .system)   //иниализатор, чтобы кнопка щелкала красива
        element.setTitle("+", for: .normal)
        element.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        element.titleLabel?.font = UIFont(name: "Arial", size: 80)
        element.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //надпись с количество персон (редактируется только нажанием на - и +)
    let counterLabel: UILabel = {
        let element = UILabel()
        element.text = "2"
        element.textColor = .black
        element.font = UIFont(name: "Arial", size: 48)
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //количество гостей
    var counter = 2

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
        addSubview(backgroundGrayView)
        
        //внутри вью, внутри поместим кнопки - и +, а также надписи с количеством персон
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped () {
        if counter == 2 {
            minusButton.isEnabled = false
        }
        counter -= 1
        counterLabel.text = "\(counter)"
    }
    
    @objc func plusButtonTapped () {
        if counter >= 1 {
            minusButton.isEnabled = true
        }
        counter += 1
        counterLabel.text = "\(counter)"

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            //Надпись Количество персон
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            //центр по оси Х должен совпадать с центром по оси Х родительского view
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            //фон
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            //кнопка минус
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor, constant: 0),
            minusButton.widthAnchor.constraint(equalToConstant: 80),

            //кнопка плюс
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor, constant: 0),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            //надпись с количеством персон
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),   //ось Y совпадает с осью Y backgroundGrayView
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10), //левая граница приклеена к правой границы кнопки -
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),//правая граница приклеена к левой границе кнопки +
            

        ])
    }
}
