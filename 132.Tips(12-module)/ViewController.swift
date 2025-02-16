//
//  ViewController.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 16.02.2025.
//

import UIKit

class ViewController: UIViewController {

      let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Деньги поровну"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
       
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
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true //Настройка размера шрифта по ширине
        label.minimumScaleFactor = 0.7 //Минимальный коэффициент масштабирования (мимимальный коэффициент, на который может уменьшиться шрифт в случае, если он будет не помещаться)
        label.numberOfLines = 2 //количество строк
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false //преобразование автоматически изменяющейся маски в констрейт
        return label
      }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
      func setupViews() {
            view.addSubview(titleLabel)   //надпись-заголовок
            view.addSubview(logoImageView) //картинка-логотип с изображением рвущегося доллара
            view.addSubview(descriptionLabel)  //вторая надпись с руководством к действию

      }
    
      func setConstraints() {
        //массив констрейнтов
        NSLayoutConstraint.activate([
              //---------------------------------------------------
              //констрейнты заголовка
              //верхнюю границу нужно привязать к верхней границе родительского view с отступом от него, равным 10. Редкий случай, когда достаточно двух констрейнтов:
              titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
              //центр по оси Х должен совпадать с центром по оси Х родительского view
              titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
              //---------------------------------------------------
              //констрейнты для картинки-лого
              //верхнюю границу нужно привязать в нижней границе надписи-заголовка titlelabel с заданным отступом
              logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
              //центр по оси Х должен совпадать с центром по оси Х родительского view
              logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              //ширина изображения должна составлять заданный коэффициент от родительского view
              logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              //высота изображения должна составлять заданный коэффициент от родительского view
             
              //---------------------------------------------------
              //констрейнты второй надписи с руководством к действию
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
            ])
           
          }
    

}

