// Brute Force: Iterate through each digit of every number to check for duplicates and sum digits.
// Optimized: Not much optimization possible here since all digits need to be checked. Keep it simple.

func replaceNumbers(_ input: String) -> String {
    let numbers = input.split(separator: " ")
    var result: [String] = []

    for number in numbers {
        // Check for consecutive duplicate digits
        if hasConsecutiveDuplicates(String(number)) {
            var sum = 0
            for char in number {
                if let digit = char.wholeNumberValue {
                    sum += digit
                }
            }
            result.append(String(sum)) // Replace with sum
        } else {
            result.append(String(number)) // Keep unchanged
        }
    }

    return result.joined(separator: " ")
}

func hasConsecutiveDuplicates(_ number: String) -> Bool {
    let digits = Array(number)
    for i in 1..<digits.count {
        if digits[i] == digits[i - 1] { return true } // Found duplicates
    }
    return false
}

// Example:
let input = "123 4558 787"
let output = replaceNumbers(input)
print(output) // Output: "123 22 787"
