//
//  #2. Add Two Numbers.swift
//  LeetCode
//
//  Created by ZverikRS on 21.12.2025.
//

/*
 Вам даны два непустых связанных списка, представляющих два неотрицательных целых числа.
 Цифры хранятся в обратном порядке, и каждый из их узлов содержит одну цифру.
 Сложите два числа и верните сумму в виде связанного списка.
 Вы можете предположить, что эти два числа не содержат никакого начального нуля, за исключением самого числа 0.
 
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

import Foundation

struct AddTwoNumbers: LeetCodeSolutionRunProtocol {
    func run() {
        print("#2: Add Two Numbers: [\(addTwoNumbers(.init(array:  [2, 4, 3]), .init(array:  [5, 6, 4]))?.description ?? "")]")
        print("#2: Add Two Numbers: [\(addTwoNumbers(.init(array:  [0]), .init(array:  [0]))?.description ?? "")]")
        print("#2: Add Two Numbers: [\(addTwoNumbers(.init(array:  [9, 9, 9, 9, 9, 9, 9]), .init(array:  [9, 9, 9, 9]))?.description ?? "")]")
        print("_________________________\n")
    }
}

// MARK: - LeetCode
private extension AddTwoNumbers {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        addTwoNumbers(correctedInt: nil, l1, l2)
    }
    
    private func addTwoNumbers(correctedInt: Int?, _ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var val: Int? = correctedInt
        if let l1, let l2 {
            val = (val ?? 0) + l1.val + l2.val
            
        } else if let l1 {
            val = (val ?? 0) + l1.val
            
        } else if let l2 {
            val = (val ?? 0) + l2.val
        }
        
        guard let val else { return nil }
        let count = val / 10
        let correctedInt = count > 0 ? count : nil
        let newVal = val - count * 10
        
        return .init(newVal, addTwoNumbers(correctedInt: correctedInt, l1?.next, l2?.next))
    }
}

// MARK: - calculated properties
private extension AddTwoNumbers.ListNode {
    var description: String {
        var array: [String] = ["\(val)"]
        if let next {
            array.append(next.description)
        }
        return array.joined(separator: ", ")
    }
    
    convenience init?(array: [Int]) {
        var array = array
        guard !array.isEmpty else {
            return nil
        }
        
        self.init(array.removeFirst())
        var currentListNode: AddTwoNumbers.ListNode = self
        for element in array {
            let newNode: AddTwoNumbers.ListNode = .init(element)
            currentListNode.next = newNode
            currentListNode = newNode
        }
    }
}
