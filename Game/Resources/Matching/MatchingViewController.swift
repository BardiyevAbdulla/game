//
//  MatchingViewController.swift
//  Game
//
//  Created by admin on 10/5/23.
//

import UIKit

class MatchingViewController: UIViewController {
    var vm = MatchingViewModel()
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentSize = CGSize(width: 321, height: 671)
        return sv
    }()
    
    lazy var buttons: [UIButton] = {
        var btns: [UIButton] = []
        for i in 0..<6{
            btns.append(createBtns(i))
        }
   return btns
    }()
    
    var lastSelected: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createBtns(_ tag: Int) -> UIButton  {
        let btn = UIButton(type: .system)
        btn.tag = tag
        if tag % 2 == 0 {
            btn.setTitle("", for: .normal)
        } else {
            btn.setImage(UIImage(named: ""), for: .normal)
        }
        btn.addTarget(self, action: #selector(answerBtnTapped(_ :)), for: .touchUpInside)
        return btn
    }
    
    @objc func answerBtnTapped(_ sender: UIButton) {
        let i = sender.tag
        if i == lastSelected {
            lastSelected = nil
            return
        }
        
        
    }
        
}
