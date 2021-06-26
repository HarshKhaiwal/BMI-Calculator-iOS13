
import UIKit
struct CalculatorBrain {
    
    var bmiValue = "0"
    var bmi:BMI?
    
    mutating func calculateBMI(height:Float, weight:Float) {
        bmiValue = String(format: "%.2f", weight/pow(height,2))
        let BmiValue = Float(bmiValue)
        if BmiValue!<18.5 {
            bmi = BMI(bmiValue: bmiValue, advice: "Eat More Pies.", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
            else if BmiValue!<24.9 {
                bmi = BMI(bmiValue: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
            }
            else{
                bmi = BMI(bmiValue: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
            }
        
    }
    func getBMI() -> String {
        return bmiValue
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
