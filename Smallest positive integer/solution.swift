public func solution(_ A : inout [Int]) -> Int {
    
    let new = Set(A).sorted(by: {$0 < $1})
    
    print(new)
    if let result = containsOne(new) {
        return result
    } else {
        for i in 0..<new.count {
            if new[i] > 1, i > 0 {
                let previous = new[i-1]
                let actual = new[i]
                if actual - 1 != previous {
                    return actual - 1
                }
            }
        }
        var max = new.max() ?? 0
        return max + 1
    }
    
    func containsOne(_ new: [Int]) -> Int?{
        if !new.contains(1) {
            return 1
        } else {
            return nil
        }
    }
}