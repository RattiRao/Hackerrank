func riddle(arr: [Int]) -> [Int] {
        var arrInfo: [Int] = arr
        var arrResult: [Int] = []
        arrResult.append(arr.max() ?? 0)
        while(arrInfo.count != 1){
            let (max,arrCompare) = getResult(arr: arrInfo)
            arrResult.append(max)
            arrInfo = arrCompare
        }
        return arrResult
}

func getResult(arr: [Int]) -> (Int,[Int]){
        var max:Int = 0
        var arrCompare: [Int] = []
        for (i,value) in arr.enumerated(){
            if i == (arr.count - 1){
                break
            }
            else{
                if (value <= arr[i+1]){
                    arrCompare.append(value)
                    if value > max{
                        max = value
                    }
                }
                else{
                    arrCompare.append(arr[i+1])
                    if arr[i+1] > max{
                        max = arr[i+1]
                    }
                }
            }
        }
        return (max,arrCompare)
 }
