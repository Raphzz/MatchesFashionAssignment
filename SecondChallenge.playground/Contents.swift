
import XCTest

// Case 1 - Does overlap
let range = 0...10
let range2 = 0...15

// Case 2 - Does not overlap
let range3 = 0...10
let range4 = 11...15

func compareRanges(range1: ClosedRange<Int>, range2: ClosedRange<Int>) -> Bool {
    let overlapList = range1.filter { range2.contains($0) }
    return !overlapList.isEmpty
}

func returnDuplicates(range1: ClosedRange<Int>, range2: ClosedRange<Int>) -> [Int] {
    return range1.map { $0 }.filter { range2.contains($0) }
}

let doesOverlap = compareRanges(range1: range, range2: range2)
let duplicates = returnDuplicates(range1: range, range2: range2)

XCTAssertTrue(doesOverlap)
XCTAssertFalse(duplicates.isEmpty)

let doesOverlapCase2 = compareRanges(range1: range3, range2: range4)
let duplicatesCase2 = returnDuplicates(range1: range3, range2: range4)

XCTAssertFalse(doesOverlap)
XCTAssertTrue(duplicates.isEmpty)

