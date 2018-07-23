//
//  ExampleCollectionViewCell.swift
//  CollectionViewBugExample
//
//  Created by Wikipedia Brown on 7/23/18.
//  Copyright © 2018 IamGoodBad. All rights reserved.
//

import UIKit


protocol CollectionViewCellListener {
    func addCell()
}

class ExampleCollectionViewCell: UICollectionViewCell {
    
    var listener: CollectionViewCellListener?
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        addSubview(label)
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(printShit)))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func printShit() {
        print("shit")
        listener?.addCell()
    }
    
    func anotherGetRandomColor()->UIColor{
        
        let newRed   = arc4random_uniform(255)/255
        let newGreen = arc4random_uniform(255)/255
        let newBlue  = arc4random_uniform(255)/255
        
        return UIColor(red: CGFloat(newRed), green: CGFloat(newGreen), blue: CGFloat(newBlue), alpha: 1.0)
    }
}
