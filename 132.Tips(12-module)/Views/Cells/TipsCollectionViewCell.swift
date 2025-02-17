//
//  TipsCollectionViewCell.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 17.02.2025.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init не был реализова")
    }
    
    func setupViews() {
        backgroundView = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius
    }
}
