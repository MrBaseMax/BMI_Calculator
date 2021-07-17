//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Макс on 01.02.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    
    //    ------------
    
    func getBMIValue() -> String {
        return String( format: "%.1f", bmi?.value ?? 0.0 )
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Нужно больше эклерчиков", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if  bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Сойдет", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Воу-воу, пора притормозить!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    

}
