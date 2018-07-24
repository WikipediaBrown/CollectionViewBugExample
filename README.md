# CollectionViewBugExample

## Description
### When inserting rows into `UICollectionView`s during unit tests, an `NSInternalInconsistencyException` is thrown and the app crashes. This doesn't happen in a simulator and only happens during the unit test. This has been documented by blogger [Feng-Pen Lin](https://github.com/fangpenlin) [here](https://fangpenlin.com/posts/2016/04/29/uicollectionview-invalid-number-of-items-crash-issue/) and in a series of answers to a Stack Overflow question [here](https://stackoverflow.com/questions/19199985/invalid-update-invalid-number-of-items-on-uicollectionview).

### A temporary solution to this bug is to call `numberOfItems(inSection: )` before adding items to the `UICollectionView`.

## Error
### `Invalid update: invalid number of items in section 0.  The number of items contained in an existing section after the update (2) must be equal to the number of items contained in that section before the update (2), plus or minus the number of items inserted or deleted from that section (1 inserted, 0 deleted) and plus or minus the number of items moved into or out of that section (0 moved in, 0 moved out).`

## Steps to Reproduce

### The  `UICollectionView` is set up to add another cell when any cell is tapped. This works as expected. There is one unit test included in the project. That unit test adds a cell just like tapping a cell. But when this unit test is run, the above error is returned.

