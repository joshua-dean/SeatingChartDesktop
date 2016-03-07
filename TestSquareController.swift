//
//  TestSquareController.swift
//  DriveSample
//
//  Created by WENDOLEK, CONNOR on 2/17/16.
//
//

import Cocoa

class TestSquareController: NSViewController {
    //potatoepotatoe
    var classList: [Class] = [Class.init(inArray: [Student.init()], name: "potatoes"), Class.init(inArray: [Student.init()], name: "potatoes2")]
    
    var spotsfilled: [Bool] = retrieveBoolArray("Spots")
    var groupcoords: [Double] = retrieveDoubleArray("GroupC")
    var subviewsfilled: [Bool] = retrieveBoolArray("Subfilled")
    
    /*
     0 - minX
     1 - minY
     2 - maxX
     3 - maxY
    */
    var subcoords: [[Double]] = retrieveObjectArray("Subcoords") as! [[Double]]
    
    
    
    
    
    
    
    override func viewDidLoad() {
        if spotsfilled.count == 0
        {
            let spotfilled = [Bool](count:2, repeatedValue: false)
            storeBoolArray("Spots", valArray: spotfilled)
        }
        
        if subviewsfilled.count == 0
        {
            subviewsfilled = [Bool](count: 5, repeatedValue: false)
            subviewsfilled[0] = true
            storeBoolArray("Subfilled", valArray: subviewsfilled)
        }
        
        if groupcoords.count == 0
        {
            groupcoords = [Double](count: 4, repeatedValue: 0.0)
            storeDoubleArray("GroupC", valArray: groupcoords)
        }
        
        if subcoords.count == 0
        {
            subcoords = [[Double]](count: 5, repeatedValue: [Double](count: 4, repeatedValue: 0.0))
            storeObjectArray("Subcoords", valArray: subcoords) //as! [[Double]]
        }
        //spotsfilled[0] = false
        //spotsfilled[1] = false
        storeBoolArray("Spots", valArray: spotsfilled)
        super.viewDidLoad()
        let temp = StudentView()
        //temp.frame = CGRectMake(0,0,200,200)
        let textField = NSTextField(frame: CGRectMake(0,0,100,100))
        textField.stringValue = "test"
        textField.editable = false
        //temp.addSubview(textField)
        let tempStudent = Student(inName: "Joe", inChair: 12, inInstrument: "Trombone")
        temp.startUp(tempStudent)
        
        let temp1 = StudentView()
        //temp1.frame = CGRectMake(0,0,200,200)
        let tempStudent1 = Student(inName: "Frederick", inChair: 12, inInstrument: "Trombone")
        temp1.startUp(tempStudent1)
        
        let temp2 = StudentView()
        let tempStudent2 = Student(inName: "Connor", inChair: 12, inInstrument: "Trombone")
        temp2.startUp(tempStudent2)
        
        let temp3 = StudentView()
        let tempStudent3 = Student(inName: "Josh", inChair: 12, inInstrument: "Trombone")
        temp3.startUp(tempStudent3)
        
        let temp4 = StudentView()
        let tempStudent4 = Student(inName: "Trevon", inChair: 12, inInstrument: "Trombone")
        temp4.startUp(tempStudent4)
        
        
        
        /*let temp1 = StudentView()
        temp1.frame = CGRectMake(0,0,100,100)
        let textField1 = NSTextField(frame: CGRectMake(0,0,50,50))
        textField1.stringValue = "test"
        textField1.editable = false
        //temp.addSubview(textField)
        temp1.startUp()
        self.view.addSubview(temp1)*/
        
        let groupView = GroupView()
        groupView.frame = CGRectMake(0,0,100,100)
        groupView.startUp(1)
        self.view.addSubview(groupView)
        
        self.view.addSubview(temp)
        self.view.addSubview(temp1)
        self.view.addSubview(temp2)
        self.view.addSubview(temp3)
        self.view.addSubview(temp4)
        
        //storeObject("GroupView", value: temp2)

    }
    
    
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    
    
    
}

