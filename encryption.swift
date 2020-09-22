func encryption(s: String) -> String {
    var strOutput: String = ""
    var arrString: Array<Array<String>> = []
    let input = (s as NSString).replacingOccurrences(of: " ", with: "")
    let root = sqrt(Double(input.count))
    var row = floor(root)
    let column = ceil(root)
    
    if Int(row * column) < input.count{
        row += 1
    }
    
    var offset: Int = 0
    var strTemp = input
    for _ in 0 ..< Int(row){
        var arr: Array<String> = []
        for j in 0 ..< Int(column){
            if (j+offset) < input.count{
                arr.append(String.init(strTemp.first!))
                strTemp.removeFirst()
            }
        }
        offset += arr.count
        arrString.append(arr)
    }
    
    for i in 0 ..< Int(column){
        for j in 0 ..< Int(row){
            if i < arrString[j].count{
                strOutput += arrString[j][i]
            }
        }
        strOutput += " "
    }
    return strOutput
}
