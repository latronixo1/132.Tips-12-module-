//
//  TipsCollectionViewCell.swift
//  132.Tips(12-module)
//
//  Created by Валентин Картошкин on 17.02.2025.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let procentLabel: UILabel = {
        let element = UILabel()
        element.text = "10%"
        element.textColor = .black
        element.font = UIFont(name: "Arial Bold", size: 24)
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init:(coder) не был реализован")
    }
    
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}
