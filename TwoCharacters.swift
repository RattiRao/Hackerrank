func alternate(s: String) -> Int {
    var arrStrNonRepeat: Array<String> = []
    var arrStr: Array<String> = []

    for chr in s{
        arrStr.append(String(chr))
    }
    arrStrNonRepeat = NSOrderedSet.init(array: arrStr.sorted()).array as? Array<String> ?? []
    var arrSubStr: Array<Array<String>> = []
    var maxCount: Int = 0
    for i in 0 ..< arrStrNonRepeat.count{
        var arrTemp = arrStrNonRepeat
        var arrSub = [arrStrNonRepeat[i]]
        for j in i+1 ..< arrStrNonRepeat.count{
            arrSub.append(arrStrNonRepeat[j])
            arrTemp.removeAll { (info) -> Bool in
                return arrSub.contains(info)
            }
            arrSubStr.append(arrTemp)
            arrSub = [arrStrNonRepeat[i]]
            arrTemp = arrStrNonRepeat
        }
    }
     
    //Cases
    for arr in arrSubStr{
        var arrStrTemp = arrStr
        for str in arr{
            arrStrTemp.removeAll { (info) -> Bool in
                return str == info
            }
        }
        if maxCount < arrStrTemp.count && self.isStringValid(arrStr: arrStrTemp){
            maxCount = arrStrTemp.count
        }
    }
    
    return maxCount
}

func isStringValid(arrStr: Array<String>) -> Bool {
    for (i,str) in arrStr.enumerated(){
        if i != arrStr.count - 1{
            if str == arrStr[i+1]{
                return false
            }
        }
    }
    if NSSet.init(array: arrStr).allObjects.count == 2{
        return true
    }
    return false
}
