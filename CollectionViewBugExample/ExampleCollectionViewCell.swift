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
        backgroundColor = randomColor
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
    
    private var randomFloat: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    private var randomColor: UIColor {
        return UIColor(red: randomFloat, green: randomFloat, blue: randomFloat, alpha: 1.0)
    }
}

