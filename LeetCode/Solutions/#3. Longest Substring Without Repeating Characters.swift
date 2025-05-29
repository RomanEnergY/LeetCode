//
//  #3. Longest Substring Without Repeating Characters.swift
//  LeetCode
//
//  Created by ZverikRS on 23.05.2025.
//

import Foundation

/*
 Given a string s, find the length of the longest substring without duplicate characters.
 
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class Solution_3: CustomStringConvertible {
    var description: String {
        let number = lengthOfLongestSubstring("abcabcbb")
        return "\(number)"
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars = Set<Character>() // Множество для хранения уникальных символов
        var left = 0 // Левый указатель окна
        var maxLength = 0 // Максимальная длина подстроки
        
        // Преобразуем строку в массив символов для удобства
        let sArray = Array(s)
        
        for right in 0 ..< sArray.count {
            // Пока текущий символ уже есть в множестве, сдвигаем левый указатель
            while chars.contains(sArray[right]) {
                chars.remove(sArray[left])
                left += 1
            }
            // Добавляем текущий символ
            chars.insert(sArray[right])
            // Обновляем максимальную длину
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}
