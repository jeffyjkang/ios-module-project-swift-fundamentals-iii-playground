import UIKit

enum Currency {
    case cad
    case mxn
}
// conversion 1.00 us dollars == 1.40 / 0.7143 canadian dollars == 23.92 / 0.0418 mexican peso
let usToCad: Double = 1.40
let usToMxn: Double = 23.92
var currency: Currency = .mxn
func convert(_ dollars: Double) -> Double {
    // check if currency is of type cad or mxn
    return currency == .cad ? dollars * 1.40 : dollars * 23.92
}
//print(convert(1.00))
func convertString(amountString: String) -> String? {
    guard let amount = Double(amountString) else {
        return "Unable to convert amount"
    }
    return String(convert(amount))
}
print(convertString(amountString: "1.00") ?? "Unable to print string")

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()
print(currencyFormatter.string(from: NSNumber(value: convert(5.00))) ?? "Cannot convert value")
