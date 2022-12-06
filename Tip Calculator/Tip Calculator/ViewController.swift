//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Ganji, Ankith J on 11/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var input: UITextField!
    @IBOutlet var total: UILabel!
    @IBOutlet var reset: UIButton!
    @IBOutlet var tipAmt: UILabel!
    @IBOutlet var sliderVal: UILabel!
    @IBOutlet var otherSlider: UISlider!
    
    var num: Float? = 10.0
    var tip: Float = 0.0
    var totalAmt: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherSlider.isHidden = true;
        sliderVal.isHidden = true
        
        
    }

    @IBAction func slider(_ sender: UISegmentedControl) {
        if(segment.selectedSegmentIndex == 0){
            tip = 0.15 * num!;
        }
        else if(segment.selectedSegmentIndex == 1){
            tip = 0.18 * num!;
        }
        else if(segment.selectedSegmentIndex == 2){
            tip = 0.2 * num!;
        }
        else if(segment.selectedSegmentIndex == 3){
            otherSlider.isHidden = false;
            sliderVal.isHidden = false
            tip = otherSlider.value * num!;
        }
        
        tipAmt.text = String(format: "%.2f", tip)
        totalAmt = tip + num!;
        total.text = String(format: "%.2f", totalAmt)
        
    }
    

    @IBAction func bill(_ sender: Any) {
        num = Float(input.text!)
    }
    
    
    @IBAction func otherAct(_ sender: UISlider) {
        sliderVal.text = "\(otherSlider.value * 100) %"
    }
}

