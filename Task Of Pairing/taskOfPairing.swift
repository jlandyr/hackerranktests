import Foundation

func taskOfPairing(freq: [Int]) -> Int {
       
        var kg = 0
        var count = 0
        var dictionaryResiduo : [Int:Int] = [:]
        for i in 0..<freq.count {
            let quantity = freq[i]
            kg = i+1
            print("freq[\(i)]: \(quantity). Kg: \(kg)")
            if quantity % 2 != 0 {
                dictionaryResiduo[kg] = quantity % 2
                if i > 0 {
                    print("residuo: \(String(describing: dictionaryResiduo[kg-1]))")
                    if let residuo = dictionaryResiduo[kg-1] {
                        count += quantity/2 + residuo
                    }
                } else {
                    count += quantity/2
                }
            } else {
                dictionaryResiduo[kg] = 0
                count += quantity/2
            }
        }
    dictionaryResiduo.forEach { (key: Int, value: Int) in
        print("dictionaryResiduo[\(key)]: \(value)")
    }
    print("dictionaryResiduo.count: \(dictionaryResiduo.count)")
        print("count: \(count)")
        return count
}