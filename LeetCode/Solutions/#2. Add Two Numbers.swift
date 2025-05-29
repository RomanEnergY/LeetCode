//
//  #2. Add Two Numbers.swift
//  LeetCode
//
//  Created by ZverikRS on 23.05.2025.
//

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order, and each of their nodes contains a single digit.
 Add the two numbers and return the sum as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example 1:
 Input: l1 = [2, 4, 3], l2 = [5, 6, 4]
 Output: [7, 0, 8]
 Explanation: 342 + 465 = 807.
 
 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]
 
 Example 3:
 Input: l1 = [9, 9, 9, 9, 9, 9, 9], l2 = [9, 9, 9, 9]
 Output: [8, 9, 9, 9, 0, 0, 0, 1]
 */

class Solution_2: CustomStringConvertible {
    var description: String {
        let l1: ListNode? = .convert(array: [9, 9, 9, 9, 9, 9, 9])
        let l2: ListNode? = .convert(array: [9, 9, 9, 9])
        
        let result = addTwoNumbers(l1, l2)
        guard let result else {
            return "[]"
        }
        
        return "[\(result.description)]"
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let array1: Array<Int> = .init(array(listNode: l1).reversed())
        let array2: Array<Int> = .init(array(listNode: l2).reversed())
        
        let sum1 = Int(array1.map { "\($0)" }.joined()) ?? 0
        let sum2 = Int(array2.map { "\($0)" }.joined()) ?? 0
        let count = sum1 + sum2
        let array: Array<Int> = .init(count.description.map { Int("\($0)") ?? 0 }.reversed())
        return .convert(array: array)
    }
    
    // MARK: - private methods
    private func array(listNode: ListNode?) -> Array<Int> {
        guard let listNode else { return [] }
        var array: Array<Int> = .init()
        var _listNode: ListNode = listNode
        array.append(listNode.val)
        
        while let next = _listNode.next {
            array.append(next.val)
            _listNode = next
        }
        
        return array
    }
}

extension Solution_2 {
    class ListNode: CustomStringConvertible {
        public var description: String {
            guard let next else {
                return "\(val)"
            }
            
            return "\(val), \(next.description)"
        }
        
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}

extension Solution_2.ListNode {
    static func convert(array: [Int]) -> Solution_2.ListNode? {
        var listNode: Solution_2.ListNode?
        guard array.count > 0 else { return nil }
        var currentlistNode: Solution_2.ListNode?
        
        for i in 0 ..< array.count {
            if i == 0 {
                listNode = .init(array[i])
                
            } else {
                let _currentlistNode = currentlistNode ?? listNode
                currentlistNode = .init(array[i])
                _currentlistNode?.next = currentlistNode
            }
        }
        
        return listNode
    }

}
