//
//  CollectionViewBugExampleTests.swift
//  CollectionViewBugExampleTests
//
//  Created by Wikipedia Brown on 7/23/18.
//  Copyright © 2018 IamGoodBad. All rights reserved.
//

import XCTest
@testable import CollectionViewBugExample

class CollectionViewBugExampleTests: XCTestCase {
    
    func testExample() {
        let collectionView = ExampleCollectionView()
        
        collectionView.addCell()
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 1, "Not enough items in section.")
    }
}
