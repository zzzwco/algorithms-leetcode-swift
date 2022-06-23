//
//  main.swift
//  DP-LongestPalindrome
//
//  Created by Bruce on 2022/6/23.
//

import Foundation

/**
 https://leetcode.cn/problems/longest-palindromic-substring/submissions/
 */

class Solution {
  func longestPalindrome(_ s: String) -> String {
    if s.isEmpty { return s }
    let arr = Array(s)
    let cnt = arr.count
    var l = 0
    var r = 0
    var dp = Array(repeating: false, count: cnt)
    for j in 0..<cnt {
      for i in 0...j {
        if arr[i] == arr[j] && (j - i <= 2 || dp[i + 1]) {
          dp[i] = true
          if j - i > r - l {
            l = i
            r = j
          }
        } else {
          dp[i] = false
        }
      }
    }
    return String(s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)])
  }
}

let s1 = "babad"
let s2 = "cbbd"
let s = Solution()
print(s.longestPalindrome(s1))
print(s.longestPalindrome(s2))
