//
//  RoundWithCircleVC.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 23/02/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import UIKit

class RoundWithCircleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let view = RoundShadowView(radius: 50)
        view.backgroundColor = UIColor.green
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

class RoundShadowView: UIControl {
    
    let containerView = UIView()
    var cornerRadius: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    init(radius: CGFloat) {
        super.init(frame: .zero)
        self.cornerRadius = radius
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        
        // set the shadow of the view's layer
//        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 50.0
        layer.cornerRadius = cornerRadius
        containerView.layer.cornerRadius = cornerRadius
        containerView.clipsToBounds = true
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.layoutView()
    }
}
