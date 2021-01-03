//
//  HikeLandCombinedOnboardingVC.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 20/05/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import UIKit

class HikeLandCombinedOnboardingVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    var collectionView: UICollectionView! //img: 77
    
    var pageControl: UIPageControl!
    
    var thisWidth:CGFloat = 0
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        thisWidth = CGFloat(self.frame.width)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//        pageControl.hidesForSinglePage = true
//
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TestCollectionViewCell.self), for: indexPath as IndexPath) as? TestCollectionViewCell {
            cell.backgroundColor = ((indexPath.row % 2) == 0) ? UIColor.green : UIColor.red
//            cell.lblTitle.text = String(indexPath.row)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        thisWidth = CGFloat(self.view.frame.width)
        return CGSize(width: thisWidth, height: self.view.frame.height)
    }
    
    override func viewDidLoad() {
        self.pageControl = UIPageControl(frame: .zero)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        thisWidth = CGFloat(self.view.frame.width)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(self.pageControl)
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TestCollectionViewCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
