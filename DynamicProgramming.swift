// Climbing Stairs
func climbStairs(_ n: Int) -> Int {
    if n <= 2 { return n }
    var first = 1
    var second = 2
    for _ in 3...n {
        let third = first + second
        first = second
        second = third
    }
    return second
}

// Coin Change
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = [Int](repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    for coin in coins {
        for j in coin...amount {
            dp[j] = min(dp[j], dp[j - coin] + 1)
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}
