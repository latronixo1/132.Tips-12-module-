//
//  ViewController.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 16.02.2025.
//

import UIKit

class MainController: UIViewController {

      let titleLabel: UILabel = {
          let label = UILabel()
          label.text = "Деньги поровну"
          label.textColor = .black
          label.font = UIFont(name: "Arial", size: 40)
       
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
     
      //картинка-логотип с изображением рвущегося доллара
      let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")  //должно быть в assets
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
      }()
     
      //надпись вторая
      let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите сумму по чеку и нажмите \"посчитать\""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 15)
        label.adjustsFontSizeToFitWidth = true //Настройка размера шрифта по ширине
        label.minimumScaleFactor = 0.7 //Минимальный коэффициент масштабирования (мимимальный коэффициент, на который может уменьшиться шрифт в случае, если он будет не помещаться)
        label.numberOfLines = 2 //количество строк
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false //преобразование автоматически изменяющейся маски в констрейт
        return label
      }()
    
      let totalSumLabel: UILabel = {
        let label = UILabel ()
        label.text = "Общая сумма"
        label.textColor = UIColor(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
      }()

    lazy var calculateButton: UIButton = {
        let element = UIButton(type: .system)   //иниализатор, чтобы кнопка щелкала красива
        element.setTitle("Рассчитать", for: .normal)
        element.tintColor = .white
        element.backgroundColor = #colorLiteral(red: 0.4426239431, green: 0.1398270428, blue: 0.4386208057, alpha: 1)
        element.titleLabel?.font = UIFont(name: "Arial", size: 20)
        element.layer.cornerRadius = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    
    //объявляем View, размещенные в других файлах
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
        func setupViews() {
            view.addSubview(titleLabel)   //надпись-заголовок
            view.addSubview(logoImageView) //картинка-логотип с изображением рвущегося доллара
            view.addSubview(descriptionLabel)  //вторая надпись с руководством к действию
            view.addSubview(totalBillView)  //вью с лейблом "Сумма по чеку" и полем ввода
            view.addSubview(personsView)  //вью с надписью "Количество персон" и возможностью установки их количества
            view.addSubview(calculateButton)  //кнопка "Рассчитать"
            view.addSubview(tipsView)

      }
    
    // MARK: Констрейнты
      func setConstraints() {
        //массив констрейнтов
        NSLayoutConstraint.activate([
              //---------------------------------------------------
              //констрейнты надписи "Деньги поровну"
              //верхнюю границу нужно привязать к верхней границе родительского view с отступом от него, равным 10. Редкий случай, когда достаточно двух констрейнтов:
              titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
              //центр по оси Х должен совпадать с центром по оси Х родительского view
              titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              //констрейнты для картинки-лого
              //верхнюю границу нужно привязать в нижней границе надписи-заголовка titlelabel с заданным отступом
              logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
              //центр по оси Х должен совпадать с центром по оси Х родительского view
              logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              //ширина изображения должна составлять заданный коэффициент от родительского view
              logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              //высота изображения должна составлять заданный коэффициент от родительского view
             
              //---------------------------------------------------
              //констрейнты надписи "Введите сумму по чеку и нажмите рассчитать"
              //верхнюю границу нужно привязать к верхней границе родительского view с отступом от него, равным 10
              descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
              //центр по оси Х должен совпадать с центром по оси Х родительского view
              descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              //ширина изображения должна составлять заданный коэффициент от родительского view
              descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              //ограничить границы:
              //Левая граница отстоит от левой границы view на 20
              descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
              //Правая граница отстоит от левой границы view на 20. Константы у правого и нижнего констрейнтов всегда пишутся с минусом, что означает отступ влево, а не вправо
              descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              
              //констрейнты view с полем ввода
              totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
              totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              totalBillView.heightAnchor.constraint(equalToConstant: 130),
              
              //констрейнты вью с количеством персон
              personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
              personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              personsView.heightAnchor.constraint(equalToConstant: 130),

              //вью с надписью "Чаевые" и UICollectionView с выбором размера чаевых
              tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
              tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              tipsView.heightAnchor.constraint(equalToConstant: 130),
              
              //констрейнты кнопки "Рассчитать"
              calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 5),
              calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              calculateButton.heightAnchor.constraint(equalToConstant: 60),
            ])
           
          }
    

}

