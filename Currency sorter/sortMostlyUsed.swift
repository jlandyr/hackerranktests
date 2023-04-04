/*
 * Complete the 'sortMostlyUsed' function below.
 *
 * The function is expected to return a STRING_ARRAY.
 * The function accepts STRING_ARRAY transactionCurrencies as parameter.
 */
 
func sortMostlyUsed(transactionCurrencies: [String]) -> [String] {
    var array : [String] = []
    var repeated = false
    var dictionary : [String:Int] = [:]
    transactionCurrencies.forEach { currency in
        if let count = dictionary[currency] {
            dictionary[currency] = count + 1
        } else {
            dictionary[currency] = 1
        }
    }
    let sorted = dictionary.sorted{$0.1 > $1.1}
    sorted.forEach { key, value in
        print("key: \(key), value: \(value)")
        array.append(key)
        if value >= 2 {
            repeated = true
        }
    }
    return repeated ? array : array.sorted()
}