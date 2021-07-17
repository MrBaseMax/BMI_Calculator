//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var hightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    let segueName = "goToResult"
    
    
    //    -------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hightSlider.value = ( hightSlider.maximumValue + hightSlider.minimumValue ) / 2
        weightSlider.value = ( weightSlider.maximumValue + weightSlider.minimumValue ) / 2
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String( format: "%.2f", sender.value / 100 ) + "m"
        //        heightLabel.text = String( "\( ( sender.value * 100 ).rounded() / 100 )m" )
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String( format: "%.0f", sender.value ) + "Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI( height: hightSlider.value / 100, weight: weightSlider.value)
        performSegue(withIdentifier: segueName, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

