import Foundation
import XCTest

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    let value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
}

func createBinaryTree(_ array: [Int]) -> TreeNode? {
    // your solution ..
    if array.count == 0 {
        return nil
    }
    
    var stack: [TreeNode] = []
    let root = TreeNode(array[0])
    stack.append(root)
    var current = root

    for index in stride(from: 1, to: array.count, by: 2) {
        print("index:", index)
        print("stack")
        for i in stack {
            print(i.value)
        }
        current = stack.first!
        print("current", current.value)
        //left
        let leftNode = TreeNode(array[index])
        current.left = leftNode
        stack.append(leftNode)
        
        //right
        if array.indices.contains(index+1) {
            let rightNode = TreeNode(array[index + 1])
            current.right = rightNode
            stack.append(rightNode)
        }
        
        stack.remove(at: 0)
    }
    
    return root
}

class TestCase: XCTestCase {
    func testNoop2() {
        let treeNode = createBinaryTree([8, 0, 4, 1, 3, 5, 6])
        XCTAssertEqual(treeNode?.value, 8)
        XCTAssertEqual(treeNode?.left?.value, 0)
        XCTAssertEqual(treeNode?.right?.value, 4)
        XCTAssertEqual(treeNode?.left?.left?.value, 1)
        XCTAssertEqual(treeNode?.left?.right?.value, 3)
        XCTAssertEqual(treeNode?.right?.left?.value, 5)
        XCTAssertEqual(treeNode?.right?.right?.value, 6)

        let treeNode2 = createBinaryTree([])
        XCTAssertEqual(treeNode2?.value, nil)
    }
}

TestCase.defaultTestSuite.run()
