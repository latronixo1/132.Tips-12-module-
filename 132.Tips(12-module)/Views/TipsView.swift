//
//  TipsView.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 17.02.2025.
//

import UIKit

//Вью c надписью "Чаевые" и ячейками (0%, 5%, 10%, 15%)
class TipsView: UIView {
    
    //надпись "Чаевые"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Чаевые"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Arial", size: 14)
     
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //ячейки UICollectionView для выбора (0%, 5%, 10%, 15%)
    let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout() //collectionViewFlowLayout - схема расположения CollectionView. Дочерний класс от UICollectionView, он определяет, как будут размещаться ячейки внутри коллекции. Зададим его позже
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout) //frame изначально будет нулевой (позже его определим), flowLayout тоже пока пустой
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    } ()
    
    let tipsArray = ["0%", "5%", "10%", "20%"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)    //frame изначально будет нулевой (позже его определим)
        
        setupView()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    //определяем делагатов, они будут определять, кто будет управлять коллекцией
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4       //количество ячеек в коллекции (а точнее будем 4 раза переиспользовать одну ячейку)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //безопасно переиспользуем ячейку. Её идентификатор "cell", индекс - indexPath
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else { //если нам удастся прокастить cell до TipsCollectionViewCell, то круто. А если нет, то вернем голый UICollectionViewCell. Это нужно для того, чтобы если прокастить не удалось, приложение не крашилось, а просто криво работало.

            return UICollectionViewCell()
        }
        //формат индексации ячеек:  [indexPath.section, indexPath.row] - у нас это [0,0], [0,1], [0,2], [0,3], где indexPath.section - номер секции (строки, ряда), у нас он равен 0 (она у нас одна), indexPath.row - номер ячейки (столбца, колонки), у нас он 0-3
        
        //в надпись procentLabel (определена в файле TipsCollectionViewCell, они будут размещаться над каждой ячейкой нашего UICollectionView) записываем элементы массива tipsArray, номер элемента в соответствии с номером ячейки, которая содержится в indexPath.row.
        cell.procentLabel.text = tipsArray[indexPath.row]
        return cell
    }
}

extension TipsView: UICollectionViewDelegate {
    //метод нажатия на ячейку (didSelectItemAt)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension TipsView: UICollectionViewDelegateFlowLayout {
    //метод, задающий размер ячеек (layout)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //здесь нам нужно вернуть размер ячейки
        //Просто ширину и высоту делаем равной ширине данного нам вью (это же рыбка в аквариуме, ей не известен размер аквариума), разделенной на 4.5 (количество ячеек + 0.5 (на расстояние между ячейками))
        CGSize(width: collectionView.frame.width / 4.5,
               height: collectionView.frame.width / 4.5)
    }
}


extension TipsView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            //Надпись Чаевые
            //верх приклеиваем к верху TipsView
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            //центр по оси Х должен совпадать с центром по оси Х родительского view
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            
            
        ])
            
        
    }
    
}
