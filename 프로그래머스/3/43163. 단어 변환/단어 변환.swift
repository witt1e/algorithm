import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var queue: [(String, Int)] = [(begin, 0)]
    var visited: Set<String> = []
    
    while !queue.isEmpty {
        let (currentWord, currentIndex) = queue.removeFirst()
        if currentWord == target { return currentIndex }
        
        for word in words {
            if visited.contains(word) { continue }
            
            if isComparable(currentWord, word) {
                queue.append((word, currentIndex + 1))
                visited.insert(word)
            }
        }
    }
    
    return 0
}

func isComparable(_ first: String, _ second: String) -> Bool {
    let lhs = first.map { String($0) }
    let rhs = second.map { String($0) }
    var isNotEqual = 0
    for index in 0..<first.count {
        if lhs[index] != rhs[index] { isNotEqual += 1 }
        if isNotEqual > 1 { break }
    }
    return isNotEqual == 1
}