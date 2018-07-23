//
//  ExampleCollectionView.swift
//  CollectionViewBugExample
//
//  Created by Wikipedia Brown on 7/23/18.
//  Copyright © 2018 IamGoodBad. All rights reserved.
//

import UIKit

class ExampleCollectionView: UICollectionView {
    var items = ["this", "that", "the other"]

    convenience init() {
        let layout = UICollectionViewFlowLayout()
        self.init(frame: .zero, collectionViewLayout: layout)
        register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: ExampleCollectionViewCell.description())
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
    }
}

extension ExampleCollectionView: UICollectionViewDataSource, CollectionViewCellListener {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ExampleCollectionViewCell.description(), for: indexPath)
        if let cell = cell as? ExampleCollectionViewCell {
            cell.listener = self
            cell.label.text = items[indexPath.item]
        }
        return cell
    }
    
    func addCell() {
        items.append(items[Int(arc4random_uniform(UInt32(items.count)))])
        insertItems(at: [IndexPath(item: items.endIndex - 1, section: 0)])
    }
}

extension ExampleCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        let adjustedSize = NSString(string: items[indexPath.item]).boundingRect(with: size,
                                                                            options: options,
                                                                            attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)],
                                                                            context: nil)
        return adjustedSize.size
    }
}
