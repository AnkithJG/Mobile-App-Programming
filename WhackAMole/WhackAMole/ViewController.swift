//
//  ViewController.swift
//  WhackAMole
//
//  Created by Ganji, Ankith J on 9/6/22.
//

import UIKit

class ViewController: UIViewController {

    var screenWidth = 0
    var screenHeight = 0
    
    var scoreBox = UILabel()
    var field = UILabel();
    var mole = UIButton();
    
    var count = 0;
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        print("screenWidth = \(screenWidth), and screenheight = \(screenHeight)")
        
        
        scoreBox.frame = CGRect(x: 0, y: 0, width: 50, height: screenHeight/10)
        scoreBox.backgroundColor = UIColor.red
        scoreBox.text = "0";
        scoreBox.font = UIFont.boldSystemFont(ofSize: 20.0)
        scoreBox.textAlignment = .center
        view.addSubview(scoreBox)
        
        
        field.backgroundColor = UIColor.green
        field.frame = CGRect(x: 0, y: 80, width: screenWidth, height: screenHeight)
        view.addSubview(field);
        
        mole.backgroundColor = UIColor.brown
        mole.frame = CGRect(x: 0, y: 90, width: 50, height: screenHeight/10)
        mole.addTarget(self, action: #selector(moleButton), for: .touchUpInside)
        view.addSubview(mole)
        
        field.text = "Tap to Start!"
        field.font = UIFont.boldSystemFont(ofSize: 55.0)
        field.textAlignment = .center
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }

    
    @objc func moleButton(_sender: UIButton!){
        count+=1;
        scoreBox.text = "\(count)"
        field.text = " ";
        let randomX = Int.random(in: 0...340)
        let randomY = Int.random(in: 100...765)
        mole.frame = CGRect(x: randomX, y: randomY, width: 50, height: screenHeight/10)
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(_sender: UIButton!){
        count -= 1
        scoreBox.text = "\(count)"
        let random2X = Int.random(in: 0...340)
        let random2Y = Int.random(in: 100...765)
        mole.frame = CGRect(x: random2X, y: random2Y, width: 50, height: screenHeight/10)
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }


}

