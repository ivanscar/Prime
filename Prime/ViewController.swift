//
//  ViewController.swift
//  Prime
//
//  Created by Ivan on 03.02.17.
//  Copyright © 2017 Ivan S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputNumberField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField==inputNumberField {
            inputNumberField.text=""
        }
    }
    
    @IBAction func onCalculateButtonPress(_ sender: Any) {
        if let val = Int(inputNumberField.text!) {
            if val > 1 {
                let primeNumbers = primes(n: val+1);
                resultLabel.text = "Сумма = \(summ(list: primeNumbers))";
            }else{
                resultLabel.text = "Введите положительное число > 1"
            }
        }else{
            resultLabel.text = "Введите целое число"
        }
    }
    

    func primes(n: Int) -> [Int] {
        var numbers = [Int](2 ..< n);
        for i in 0..<n - 2 {
            let prime = numbers[i];
            if (prime > 0){
                for multiple in stride(from: 2 * prime - 2, to: n - 2, by: prime){
                    numbers[multiple] = 0;
                }
            } else {
                continue;
            }

        }
        return numbers.filter{ $0 > 0 }
    }
    
    func summ(list:[Int])->UInt64{
        var result:UInt64 = 0;
        list.forEach {
            result=result+UInt64($0);
        }
        return result;
    }
    
}

