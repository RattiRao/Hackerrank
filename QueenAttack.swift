func queensAttack(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) -> Int {
    var countPosition = 0
    var arrGreenPoint: [[Int]] = []
    
    if c_q != n{
        /// Horizontal forward
        for i in (c_q + 1) ..< k+1{
            if obstacles.contains([r_q,i]){
                break
            }
            else if !arrGreenPoint.contains([r_q,i]){
                arrGreenPoint.append([r_q,i])
                countPosition += 1
            }
        }
    }
    
    if c_q != 1{
        /// Horizontal backward
        for i in stride(from: (c_q - 1), to: 0, by: -1){
            if obstacles.contains([r_q,i]){
                break
            }
            else if !arrGreenPoint.contains([r_q,i]){
                arrGreenPoint.append([r_q,i])
                countPosition += 1
            }
        }
    }
    
    if r_q != n{
        ///Upward Vertical
        for i in (r_q + 1) ..< n+1{
            if obstacles.contains([i,c_q]){
                break
            }
            else if !arrGreenPoint.contains([i,c_q]){
                arrGreenPoint.append([i,c_q])
                countPosition += 1
            }
        }
    }
    
    if r_q != 1{
        ///Down Vertical
        for i in stride(from: (r_q - 1), to: 0, by: -1){
            if obstacles.contains([i,c_q]){
                break
            }
            else if !arrGreenPoint.contains([i,c_q]){
                arrGreenPoint.append([i,c_q])
                countPosition += 1
            }
        }
    }
    
    if r_q != 1 && c_q != n{
        /// Diagonal Down Right
        var column = c_q
        for i in stride(from: (r_q - 1), to: 0, by: -1){
            column += 1
            if obstacles.contains([i,column]){
                break
            }
            else if !arrGreenPoint.contains([i,column]){
                arrGreenPoint.append([i,column])
                countPosition += 1
            }
        }
    }
    
    if r_q != n && c_q != 1{
        /// Diagonal Upward Left
        var column = c_q
        for i in (r_q + 1) ..< n+1{
            column -= 1
            if obstacles.contains([i,column]){
                break
            }
            else if !arrGreenPoint.contains([i,column]){
                arrGreenPoint.append([i,column])
                countPosition += 1
            }
        }
    }
    
    if c_q != n && r_q != n{
        // Diagonal Upward Right
        var column = c_q
        for i in (r_q + 1) ..< n+1{
            column += 1
            if obstacles.contains([i,column]){
                break
            }
            else if !arrGreenPoint.contains([i,column]){
                arrGreenPoint.append([i,column])
                countPosition += 1
            }
        }
    }
    
    if c_q != 1 && r_q != 1{
        // Diagonal Down Left
        var column = c_q
        for i in stride(from: (r_q - 1), to: 0, by: -1){
            column -= 1
            if obstacles.contains([i,column]){
                break
            }
            else if !arrGreenPoint.contains([i,column]){
                arrGreenPoint.append([i,column])
                countPosition += 1
            }
        }
    }
    
    return countPosition
}
