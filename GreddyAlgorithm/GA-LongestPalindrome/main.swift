//
//  main.swift
//  GA-LongestPalindrome
//
//  Created by Bruce on 2022/6/23.
//

import Foundation

/**
 https://leetcode.cn/problems/longest-palindrome/
 */

class Solution {
  
  // O(n), O(|Σ|)
  func longestPalindrome(_ s: String) -> Int {
    var table: [Character : Int] = [:]
    for char in Array(s) {
      if table[char] == nil {
        table[char] = 1
      } else {
        table[char]! += 1
      }
    }
    var ans = 0
    for (_, v) in table {
      ans += v / 2 * 2
      if v % 2 == 1 && ans % 2 == 0 {
        ans += 1
      }
    }
    return ans
  }
}




