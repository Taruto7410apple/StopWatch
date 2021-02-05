//
//  ViewController.swift
//  StopWatch
//
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var comment:UILabel!
    
    var count: Float=0.0
    
    var timer: Timer=Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        comment.isHidden=true
    }
    
    @objc func up(){
        count=count+0.01
        
        label.text=String(format:"%.2f",count)
    }
    
    @IBAction func start(){
        
        if !timer.isValid{
            timer=Timer.scheduledTimer(timeInterval: 0.01,
                                      target:self,
                                      selector: #selector(self.up),
                                      userInfo:nil,
                                      repeats:true)
        }
        
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        self.hantei()
        
        
    }
    
    @IBAction func reset(){
        
        if timer.isValid{
            timer.invalidate()
            
        }
        count=0.00
        label.text=String(count)
        comment.isHidden=true
    }
    func hantei(){
//        if 9.80<=count && count<=10.20{
//            comment.isHidden=false
//        }
        
        switch count{
        case (9.80...10.20):
            comment.isHidden=false
            
        case (9.70...10.30):
            comment.isHidden=false
            comment.text="GREAT"
            
        case (9.50...10.50):
            comment.isHidden=false
            comment.text="GOOD"
            
        default:
            comment.isHidden=false
            comment.text="BAD"
        }


  }

}

