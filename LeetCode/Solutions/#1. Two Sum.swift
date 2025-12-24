//
//  #1. Two Sum.swift
//  LeetCode
//
//  Created by ZverikRS on 21.12.2025.
//

/*
 Учитывая массив целых чисел nums и целочисленную цель, верните индексы двух чисел таким образом, чтобы они в сумме давали цель.
 Вы можете предположить, что каждый вход будет иметь ровно одно решение, и вы не сможете использовать один и тот же элемент дважды.
 Вы можете вернуть ответ в любом порядке.
 
 Example 1:
 Input: nums = [2, 7, 11, 15], target = 9
 Output: [0, 1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3, 2, 4], target = 6
 Output: [1, 2]
 
 Example 3:
 Input: nums = [3, 3], target = 6
 Output: [0, 1]
 */

import Foundation

struct TwoSum: LeetCodeSolutionRunProtocol {
    func run() {
        print("#1: Two Sum: \(twoSum([2, 7, 11, 15], 9))")
        print("#1: Two Sum: \(twoSum([3, 2, 4], 6))")
        print("#1: Two Sum: \(twoSum([3, 3], 6))")
        print("_________________________\n")
    }
}

// MARK: - LeetCode
private extension TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var map: Dictionary<Int, Int> = [:]
       for (index, value) in nums.enumerated() {
           let a = target - value
           if let b = map[a] {
               return [b, index]
           }
           map[value] = index
       }
       
       return []
   }
}
