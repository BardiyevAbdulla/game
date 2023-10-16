//
//  TapBarViewController.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import UIKit

var windowWidth = UIScreen.main.bounds.width
var windowHeight = UIScreen.main.bounds.height


class TapBarViewController: UIViewController {
    
    lazy var collection: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TapBarItemCell.self, forCellWithReuseIdentifier: "TapBarItemCell")
        collection.dataSource = self
        collection.delegate = self
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    let vm = TabBarViewModel()
   // var list: [ItemModel] = list
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       setupCollectionView()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       
        windowWidth = size.width
        windowHeight = size.height
        vm.reload()
        embedCollection()
        collection.reloadData()
    }
    
    func setupCollectionView() {
        embedCollection()
        view.addSubview(collection)
    }
    
    func embedCollection() {
        collection.frame = CGRect(x: vm.space, y: vm.space, width: windowWidth - vm.space - vm.space, height: windowHeight - vm.space - vm.space)
    }
    
    

}

extension TapBarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TapBarItemCell", for: indexPath) as? TapBarItemCell else { return UICollectionViewCell() }
        cell.configure(list[indexPath.row], width: vm.sizeOfItem)
        
        cell.layer.cornerRadius = 24
        cell.clipsToBounds = true
        cell.layer.masksToBounds = true
        cell.backgroundColor = .brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: vm.sizeOfItem, height: vm.sizeOfItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return vm.space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return vm.space
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ChoosingViewController(list[indexPath.row])
        self.present(vc, animated: true)
        //navigationController?.pushViewController(, animated: true)
    }
    
    
}
