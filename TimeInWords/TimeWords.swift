extension Int{
    func getWord() -> String {
        let number = NSNumber.init(value: self)
        let format = NumberFormatter.init()
        format.numberStyle = .spellOut
        return (format.string(from: number)! as NSString).replacingOccurrences(of: "-", with: " ")
    }
}
var arrTime: Array<String> = ["one", "two", "three", "four", "five","six", "seven", "eight", "nine", "ten", "eleven", "twelve"]

func timeInWords(h: Int, m: Int) -> String {
    var strTime: String = ""
    if m <= 30{
        let time = (h-1) < 1 ? arrTime[11] : arrTime[h-1]
        switch m {
        case 0:
            strTime = time + " o' " + "clock"
        
        case 15:
        strTime = "quarter past " + time
            
        case 30:
        strTime = "half past " + arrTime[h-1]
            
        default:
            let wordMinute = m < 10 ? "minute" : "minutes"
            strTime = m.getWord() + " " + wordMinute + " past " + arrTime[h-1]
        }
    }
    else{
        let time = h > arrTime.count ? arrTime[0] : arrTime[h]
        switch m {
        case 45:
            strTime = "quarter to " + time
            
        default:
            strTime = (60-m).getWord() + " minutes to " + time
        }
    }
    return strTime
}
