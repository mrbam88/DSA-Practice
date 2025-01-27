// Number of Islands
func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    var count = 0
    let rows = grid.count
    let cols = grid[0].count
    
    func dfs(_ r: Int, _ c: Int) {
        if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != "1" {
            return
        }
        grid[r][c] = "0"
        dfs(r + 1, c)
        dfs(r - 1, c)
        dfs(r, c + 1)
        dfs(r, c - 1)
    }
    
    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == "1" {
                count += 1
                dfs(r, c)
            }
        }
    }
    return count
}

// Clone Graph
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }
    var map = [Int: Node]()
    
    func clone(_ node: Node) -> Node {
        if let clonedNode = map[node.val] {
            return clonedNode
        }
        let clonedNode = Node(node.val)
        map[node.val] = clonedNode
        for neighbor in node.neighbors {
            if let neighbor = neighbor {
                clonedNode.neighbors.append(clone(neighbor))
            }
        }
        return clonedNode
    }
    return clone(node)
}
