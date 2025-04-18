import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack: [Character] = []
    var remaining = k

    for digit in number {
        while !stack.isEmpty && remaining > 0 && stack.last! < digit {
            stack.removeLast()
            remaining -= 1
        }
        stack.append(digit)
    }

    if remaining > 0 {
        stack.removeLast(remaining)
    }

    let result = String(stack)
    return result
}