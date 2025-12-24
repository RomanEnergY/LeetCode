//
//  #3. Longest Substring Without Repeating Characters.swift
//  LeetCode
//
//  Created by ZverikRS on 21.12.2025.
//

/*
 Учитывая строку s, найдите длину самой длинной подстроки без повторяющихся символов.
 
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
 
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

import Foundation

struct LengthOfLongestSubstring: LeetCodeSolutionRunProtocol {
    func run() {
        print("#3: Longest Substring Without Repeating Characters: \(lengthOfLongestSubstring("abcabcbb"))")
        print("#3: Longest Substring Without Repeating Characters: \(lengthOfLongestSubstring("bbbbb"))")
        print("#3: Longest Substring Without Repeating Characters: \(lengthOfLongestSubstring("pwwkew"))")
        print("_________________________\n")
    }
}

// MARK: - LeetCode
private extension LengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var substring: String = ""
        var index: String.Index = s.startIndex
        
        while index < s.endIndex {
            let element = String(s[index])
            
            if !substring.contains(element) {
                substring.append(element)
                index = s.index(after: index)
                
            } else {
                break
            }
        }
        
        let nextText: String = .init(s.dropFirst())
        return max(substring.count, lengthOfLongestSubstring(nextText))
    }
}
