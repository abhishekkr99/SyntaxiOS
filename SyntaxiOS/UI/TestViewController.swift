//
//  TestViewController.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 16/01/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


import UIKit
//import ScalingCarousel

class CodeCell: ScalingCarouselCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CodeViewController: UIViewController {
    
    // MARK: - Properties (Private)
    fileprivate var scalingCarousel: ScalingCarouselView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        addCarousel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if scalingCarousel != nil {
            scalingCarousel.deviceRotated()
        }
    }
    
    // MARK: - Configuration
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 30)
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .white
        
        scalingCarousel.register(CodeCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(scalingCarousel)
        
        // Constraints
        scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scalingCarousel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        scalingCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scalingCarousel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
}

extension CodeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            scalingCell.mainView.backgroundColor = .blue
        }
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}

extension CodeViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //scalingCarousel.didScroll()
    }
}
