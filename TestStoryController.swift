//
//  TestStoryController.swift
//  DriveSample
//
//  Created by WENDOLEK, CONNOR on 1/20/16.
//
//


import Cocoa

class TestStoryController: NSViewController {
    //potatoepotatoe
    var classList: [Class] = [Class.init(inArray: [Student.init()], name: "potatoes"), Class.init(inArray: [Student.init()], name: "potatoes2")]
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let potatoe = CurveView(inRect: CGRectMake(50, 50, 300, 300), isLeft: true)
        self.view.addSubview(potatoe)
        
        let potatoe2 = CurveView(inRect: CGRectMake(50, 50, 300, 300), isLeft: false)
        self.view.addSubview(potatoe2)
        
      //  let bigpotatoe = CurveView(inRect: CGRectMake(100, 100, 150, 150), isLeft: false)
        //self.view.addSubview(bigpotatoe)
        //let temp = GroupView()
        //temp.frame = CGRectMake(50,50,100,100)
       // temp.startUp(3)
        //self.view.addSubview(temp)
    }
    

    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    

    
    
}

