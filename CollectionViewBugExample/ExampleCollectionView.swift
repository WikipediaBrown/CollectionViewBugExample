//
//  ExampleCollectionView.swift
//  CollectionViewBugExample
//
//  Created by Wikipedia Brown on 7/23/18.
//  Copyright © 2018 IamGoodBad. All rights reserved.
//

import UIKit

class ExampleCollectionView: UICollectionView {
    var items = ["TAP ME"]
    
    var words = ["To define a custom invalidation context for your layout, subclass the UICollectionViewLayoutInvalidationContext class. In your subclass,", " define custom properties that represent the parts of your layout data that can be recomputed independently.", " When you need to invalidate your layout at runtime, create an instance of your invalidation context subclass, configure the custom properties based on what layout information changed, and pass that object to your layout’s invalidateLayoutWithContext: method.", " Your custom implementation of that method can use the information in the invalidation context to recompute only the portions of your layout that changed.", "If you define a custom invalidation context class for your layout object, you should also override the invalidationContextClass method and return your custom class. ", "Returning your custom subclass from this method ensures that your layout object always has the invalidation context it expects.", "In addition to these methods, you can also override the prepareForCollectionViewUpdates: to handle any layout-related preparation.", "You can also override the finalizeCollectionViewUpdates method and use it to add animations to the overall animation block or to implement any final layout-related tasks."]

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
        items.append(words[Int(arc4random_uniform(UInt32(words.count)))])
        insertItems(at: [IndexPath(item: items.endIndex - 1, section: 0)])
        scrollToItem(at: IndexPath(item: items.endIndex - 1, section: 0), at: .bottom, animated: true)
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
