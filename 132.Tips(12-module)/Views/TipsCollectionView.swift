//
//  TipsCollectionView.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 17.02.2025.
//

import UIKit

class TipsCollectionView: UICollectionView {
    
    var flowLayout = UICollectionViewFlowLayout()   //пустой дочерний класс от UICollectionView, он определяет, как будут размещаться ячейки внутри коллекции. Зададим его позже
    
    //инициализатор принимает значение типа CGRect - это размеры, в которые надо поместить UICollectionView
    //и UICollectionViewLayout - дочерний класс от UICollectionView, он определяет, как будут размещаться ячейки внутри коллекции
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout) //frame изначально будет нулевой (позже его определим), flowLayout тоже пока пустой
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }
    
    func setupView() {
        delegate = self
        dataSource = self
    }
}

extension TipsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {   //numberOfItemsInSection количество ячеев в коллекции
        4   //4 - количество ячеек в коллекции
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {  //если нам удастся прокастить cell до TipsCollectionViewCell, то круто. А если нет, то вернем голый UICollectionViewCell
            return UICollectionViewCell()
        }
        return cell
    }
}

extension TipsCollectionView: UICollectionViewDelegate {
    
}
