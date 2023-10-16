//
//  ChoosingItemCell.swift
//  Game
//
//  Created by admin on 10/4/23.
//

import UIKit

protocol ChoosingItemCellDelegate: NSObject {
    func didTapped(_ isCurrect: Bool)
}

class ChoosingItemCell: UICollectionViewCell {
    
    lazy var leftTopBtn: UIButton = {[weak self] in
        
        return createBtns(0)
    }()
    
    lazy var leftBotBtn: UIButton = {[weak self] in
        return createBtns(1)
    }()
    
    lazy var rightTopBtn: UIButton = {[weak self] in
        return createBtns(2)
    }()
    
    lazy var rightBotBtn: UIButton = {[weak self] in
        return createBtns(3)
    }()
    
    weak var delegate: ChoosingItemCellDelegate?
    
    var currectItem: ItemModel?
    var items: [ItemModel]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    func initView() {
        contentView.addSubviews(leftBotBtn, leftTopBtn, rightTopBtn, rightBotBtn)
        
        leftTopBtn.frame = CGRect(x: 10, y: 10, width: 90, height: 90)
        leftBotBtn.frame = CGRect(x: 10, y: 180, width: 90, height: 90)
        
        rightTopBtn.frame = CGRect(x: windowWidth-130, y: 10, width: 90, height: 90)
        rightBotBtn.frame = CGRect(x: windowWidth-130, y: 180, width: 90, height: 90)
    }
    
    func configure(_ items: [ItemModel], currectItem: ItemModel) {
        self.items = items
        self.currectItem = currectItem
        leftTopBtn.setTitle(items[0].name, for: .normal)
        leftBotBtn.setTitle(items[1].name, for: .normal)
        rightTopBtn.setTitle(items[2].name, for: .normal)
        rightBotBtn.setTitle(items[3].name, for: .normal)
    }
    
    func currect() {
        
    }
    
    func failed() {
        
    }
    
    
    func createBtns(_ tag: Int) -> UIButton  {
        let btn = UIButton(type: .system)
        btn.tag = tag
        btn.addTarget(self, action: #selector(answerBtnTapped(_ :)), for: .touchUpInside)
        return btn
    }
    
    @objc func answerBtnTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        if currectItem!.id == items![tag].id {
            self.delegate?.didTapped(true)
             currect()
        } else {
            self.delegate?.didTapped(false)
            failed()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
