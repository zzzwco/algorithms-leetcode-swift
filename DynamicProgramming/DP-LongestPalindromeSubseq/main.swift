//
//  main.swift
//  DP-LongestPalindromeSubseq
//
//  Created by Bruce on 2022/6/24.
//

import Foundation

/**
 https://leetcode.cn/problems/longest-palindromic-subsequence/
 */

class Solution {
  
  // O(n^2), O(n^2)
  func longestPalindromeSubseq(_ s: String) -> Int {
    let n = s.count
    var dp: [[Int]] = Array(
      repeating: Array(repeating: 0, count: n),
      count: n)
    let sa = Array(s)
    for i in (0..<n).reversed() {
      dp[i][i] = 1
      for j in i+1..<n {
        if sa[i] == sa[j] {
          dp[i][j] = dp[i + 1][j - 1] + 2
        } else {
          dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
        }
      }
    }
    return dp[0][n - 1]
  }
}

let s1 = "bbbab"
let s2 = "cbbd"
let s3 = "abccccdd"
let s4 = "bbbabbb"

let s = Solution()
print(s.longestPalindromeSubseq(s1))
print(s.longestPalindromeSubseq(s2))
print(s.longestPalindromeSubseq(s3))
print(s.longestPalindromeSubseq(s4))

