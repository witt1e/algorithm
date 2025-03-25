import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    for operation in operations {
        let number = Int(operation.dropFirst(2))!
        if operation.prefix(1) == "I" {
            queue.append(number)
            queue.sort()
        }
        if operation.prefix(1) == "D", !queue.isEmpty {
            if number > 0 {
                queue.removeLast()
            } else {
                queue.removeFirst()
            }
        }
    }
    
    if queue.isEmpty {
        return [0, 0]
    } else {
        return [queue.last!, queue.first!]
    }
}