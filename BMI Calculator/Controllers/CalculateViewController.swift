//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var Calculator = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f",sender.value)+"m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String("\(Int(sender.value))Kg")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        Calculator.calculateBMI(height: height,weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
//
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", BMI)
//        self.present(secondVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController //specify the data type that destination will be
            destinationVC.bmiValue = Calculator.getBMI()
            destinationVC.advice = Calculator.getAdvice()
            destinationVC.color = Calculator.getColor()
        }
    }


}

