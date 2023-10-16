//
//  ChoosingViewController.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import UIKit

class ChoosingViewController: UIViewController {
    var item: ItemModel
    var vm = ChoosingViewModel()
    
    init(_ model: ItemModel) {
        self.item = model
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var collection: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: windowWidth-1, height: 270)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ChoosingItemCell.self, forCellWithReuseIdentifier: "ChoosingItemCell")
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.isScrollEnabled = false
        return collection
    }()
    
    lazy var imageView: UIImageView = { [weak self] in
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: vm.listItem[0].image)
        
        return iv
    }()
    
    lazy var quesionLabel: UILabel = { [weak self] in
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.text = "question: \(vm.index+1)/\(vm.listItem.count)"
        return lb
    }()
    
    lazy var scoreLabel: UILabel = { [weak self] in
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.text = "score: \(vm.score)/30"
        return lb
    }()
    
    
    lazy var nextButton: UIButton = { [weak self] in
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "back_icon"), for: .normal)
        btn.addTarget(self, action: #selector(nextBtnTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(quesionLabel, scoreLabel, collection, nextButton, imageView)
        self.embedViews()
       
    }
    
    func embedViews() {
        quesionLabel.frame = CGRect(x: vm.space, y: vm.space+40, width: 120, height: 30)
        scoreLabel.frame = CGRect(x: windowWidth - vm.space - 120, y: vm.space+40, width: 120, height: 30)
        
        
        imageView.frame = CGRect(x: (windowWidth - vm.imWidth)/2, y: scoreLabel.frame.maxY+20, width: vm.imWidth, height: vm.imHeight)
    
        collection.frame = CGRect(x: 0, y: windowHeight-430, width: windowWidth, height: 271)
        let btnWidth: CGFloat = 120
        nextButton.frame = CGRect(x: windowWidth-btnWidth-20, y: collection.frame.maxY+8, width: btnWidth, height: 90)
        
    }
    
    func finish() {
        if vm.itemSet.isEmpty {
            return
        }
        vm.isFinished = true
    }
    
    func calculatePage() {
        vm.checkAnswer()
        guard let _ = vm.nextPage() else {
            finish()
            return }
        imageView.image = UIImage(named: vm.listItem[vm.index].image)
        quesionLabel.text = "question: \(vm.index+1)/\(vm.listItem.count)"
        scoreLabel.text = "score: \(vm.score)/\(vm.listItem.count)"
        collection.isPagingEnabled = false
        collection.scrollToItem(at: IndexPath(row: vm.index, section: 0), at: .centeredHorizontally, animated: true)
        collection.isPagingEnabled = true
        collection.reloadData()
    }
    
    @objc func nextBtnTapped(_ sender: UIButton) {
        vm.itemSet.insert(vm.listItem[vm.index])
        calculatePage()
    }
   
}

extension ChoosingViewController: ChoosingItemCellDelegate {
    func didTapped(_ isCurrect: Bool) {
        vm.itemSet.remove(vm.listItem[vm.index])
        if isCurrect {
            vm.score += 1
        }
        calculatePage()
    }
    

}

extension ChoosingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoosingItemCell", for: indexPath) as! ChoosingItemCell
        cell.configure(vm.shuffleItems[indexPath.row+1], currectItem: vm.listItem[indexPath.row])
        cell.backgroundColor = .brown
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: windowWidth-1, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
