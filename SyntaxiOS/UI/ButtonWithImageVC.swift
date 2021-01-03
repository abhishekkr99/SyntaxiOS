//
//  ButtonWithImageVC.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 24/03/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import UIKit

class ButtonWithImageVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = CustomButtonWithSpace()
//        btn.setTitle("hello", for: .normal)
//        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setImage(UIImage(named: "ic_bold_mute"), for: .normal)
        btn.backgroundColor = UIColor.red
//        btn.contentEdgeInsets = UIEdgeInsets(top: 16, left: 10, bottom: 6, right: 16)
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

class CustomButtonWithSpace: UIButton {
    init() {
        super.init(frame: .zero)
        self.setTitle("hello", for: .normal)
        self.setTitleColor(UIColor.blue, for: .normal)
        self.setImage(UIImage(named: "ic_bold_mute"), for: .normal)
        self.centerTextAndImage(spacing: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 6, left: insetAmount + 10, bottom: 6, right: insetAmount + 10)
    }
}
