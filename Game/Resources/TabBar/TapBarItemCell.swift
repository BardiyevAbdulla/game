//
//  TapBarItemCell.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import UIKit

class TapBarItemCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = { [weak self] in
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = { [weak self] in
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
        
        nameLabel.centerX(inView: self.contentView)
        nameLabel.anchor(bottom: contentView.bottomAnchor, width: 90, height: 35)
        
        imageView.anchor( bottom: nameLabel.topAnchor, width: 100, height: 100)
        imageView.centerX(inView: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: ItemModel, width: CGFloat) {
        self.imageView.image = UIImage(named: model.image) 
        self.nameLabel.text = model.name
    }
    
    
}

struct ItemModel: Identifiable, Hashable {
    let id: Int
    var image: String
    var name: String
}
