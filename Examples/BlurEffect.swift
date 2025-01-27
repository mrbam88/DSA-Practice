// Brute Force: For every pixel, iterate over all its neighbors within the radius, summing and counting.
// Optimized: Precompute cumulative sums for rows/columns (if array size is large) to speed up neighbor calculations.

func applyBlurEffect(_ image: [[Int]], radius: Int) -> [[Int]] {
    let rows = image.count
    let cols = image[0].count
    var blurredImage = Array(repeating: Array(repeating: 0, count: cols), count: rows)

    // Brute Force: Check all neighbors for each pixel
    for i in 0..<rows {
        for j in 0..<cols {
            var sum = 0
            var count = 0

            // Iterate over neighbors within the radius
            for r in max(0, i - radius)...min(rows - 1, i + radius) {
                for c in max(0, j - radius)...min(cols - 1, j + radius) {
                    sum += image[r][c]
                    count += 1
                }
            }

            blurredImage[i][j] = sum / count // Replace with mean
        }
    }

    return blurredImage
}

// Example:
let image = [
    [9, 6],
    [3, 0]
]
let radius = 1
let blurredImage = applyBlurEffect(image, radius)
for row in blurredImage {
    print(row) // Output: [[6, 5], [4, 3]]
}
