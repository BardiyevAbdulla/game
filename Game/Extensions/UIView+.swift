//
//  UIView+.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import UIKit

extension UIView{
    
    func inputContainerView(image:UIImage,textField:UITextField? = nil,segmentedControl:UISegmentedControl? = nil) -> UIView{
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
     
        
        
        if let textField = textField {
            imageView.anchor(left:view.leftAnchor,paddingLeft: 8,width: 24,height: 24)
        view.addSubview(textField)
        textField.centerY(inView: view)
            textField.anchor(left:imageView.rightAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,paddingLeft: 8,paddingBottom: 8)
            
        }
        if let segmentedControl = segmentedControl {
            imageView.anchor(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,paddingTop: -8,paddingLeft: 8, paddingBottom: 50,width: 24,height: 24)
            
            view.addSubview(segmentedControl)
            segmentedControl.anchor(left:view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,paddingLeft: 8,paddingBottom: 8)
        }
        
        let separatorView = UIView()
        view.addSubview(separatorView)
        separatorView.backgroundColor = .lightGray
        separatorView.anchor(left:view.leftAnchor,bottom: view.bottomAnchor,right:view.rightAnchor,paddingLeft: 8, height:0.75)
        return view
    }
    
    func anchor(top:NSLayoutYAxisAnchor? = nil,
                left:NSLayoutXAxisAnchor? = nil,
                bottom:NSLayoutYAxisAnchor? = nil,
                right:NSLayoutXAxisAnchor? = nil,
                paddingTop:CGFloat = 0,
                paddingLeft:CGFloat = 0,
                paddingBottom:CGFloat = 0,
                paddingRight:CGFloat = 0,
                width:CGFloat? = nil,
                height:CGFloat? = nil){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view:UIView){
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view:UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func addSubviews(_ views: UIView ... ) {
        for item in views {
            self.addSubview(item)
        }
    }
}
