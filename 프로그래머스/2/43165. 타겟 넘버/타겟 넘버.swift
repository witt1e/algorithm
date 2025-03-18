import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == numbers.count {
            if sum == target {
                count += 1
            }
            // index가 끝까지 갔으면 target과 일치하는지 확인하고,
            // 일치하든 안하든 루프 종료.
            return
        }
        
        // index를 1 증가시키고,
        // sum에 index 숫자를 +, - 더한 후, 다음 재귀함수로 각각 넘겨야 함.
        
        dfs(index + 1, sum + numbers[index])
        dfs(index + 1, sum - numbers[index])
    }
    
    dfs(0, 0) // index 0, sum 0으로 시작
    
    return count
}