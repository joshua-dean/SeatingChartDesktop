//
//  StudentView.swift
//

import Cocoa
import Foundation
import AppKit


class StudentView: NSView {
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var acceptsFirstResponer = true
    var acceptsFirstMouse = true
    let viewLength: CGFloat = 50
    let viewHeight: CGFloat = 50
    var firstClick = CGPoint()
    var firstFrame = CGPoint()
    var clickX: CGFloat = 0
    var clickY: CGFloat = 0
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    var updateTimer = NSTimer()
    var student = Student()
    var groups = GroupView(inRect: CGRectMake(50, 100, 300, 100), subviews: 1)
    
    init(inRect: CGRect, inStudent: Student)
    {
        //groups = groupIn
        
        super.init(frame: inRect)
        delay(0.1)
        {
            Swift.print(self.superview?.subviews)
            self.groups = self.superview!.subviews[0] as! GroupView
            //GroupView(inView: (self.superview?.subviews[0])!)
        }
        //groups = GroupView(inView: (self.superview?.subviews[0])!)
        
        let label = NSTextField(frame: CGRectMake(0, 0, viewLength, viewHeight))
        student = inStudent
        label.stringValue = student.getName()
        label.editable = false
        self.addSubview(label)
        self.frame = inRect
        self.setNeedsDisplayInRect(self.frame) //makes context exist
        //self.frame = CGRectMake(0, 0, viewLength, viewHeight)
        label.backgroundColor = NSColor.purpleColor()
        
        //groups = GroupView(inView: (self.superview!.subviews[0]))
        
        updateTimer = NSTimer.scheduledTimerWithTimeInterval(0.00001, target: self, selector: "updateLocation:", userInfo: nil, repeats: true)
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLocation(obj:AnyObject?)
    {
        if groups.isdragging
        {
            var subviewlocation = groups.getSubviewWithName(student.getName())
            if subviewlocation > -1
            {
                let i = groups.getCoordsOfSubview(subviewlocation).x
                let h = groups.getCoordsOfSubview(subviewlocation).y
                self.frame = CGRectMake(i, h, viewLength, viewHeight)
            }
        }
        //self.superview?.subviews[0]
        /*if groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).0
        {
            let i = groups.getCoordsOfSubview(groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1).x
            let h = groups.getCoordsOfSubview(groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1).y
            let change = groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1
            groups.setSubviewSnap(change, value: true)
            self.frame = CGRectMake(i, h, viewLength, viewHeight)
        }*/
    }
    
    override func acceptsFirstMouse(theEvent: NSEvent?) -> Bool {
        return true
    }
    
    override func mouseDown(theEvent: NSEvent)
    {
        Swift.print(self.superview!.subviews)
        
        firstClick = theEvent.locationInWindow
        firstFrame = CGPoint(x: self.frame.minX, y: self.frame.minY)
        
        clickX = firstClick.x
        clickY = firstClick.y
        
        if groups.doDaSnap(CGPointMake(clickX, clickY)).0
        {
            let change = groups.doDaSnap(CGPointMake(clickX, clickY)).1
            groups.setSubviewSnap(change, value: false)
            groups.subviewArray[change].setStudent(Student(inName: "", inChair: 0, inInstrument: ""))
        }
        
    }
    
    override func rightMouseDown(theEvent : NSEvent) {
        let theMenu = NSMenu(title: "Contextual menu")
        theMenu.addItemWithTitle("Name: " + student.getName(), action: Selector("action1:"), keyEquivalent: "")
        theMenu.addItemWithTitle("Chair #" + String(student.getChair()), action: Selector("action2:"), keyEquivalent: "")
        theMenu.addItemWithTitle(String(student.getInstrument()), action: Selector("action2:"), keyEquivalent: "")
        
        for item: AnyObject in theMenu.itemArray {
            if let menuItem = item as? NSMenuItem {
                menuItem.target = self
            }
        }
        
        NSMenu.popUpContextMenu(theMenu, withEvent: theEvent, forView: self)
    }
    
    override func mouseDragged(theEvent: NSEvent)
    {
        //groups = GroupView(inView: self.superview!.subviews[0])
        //Swift.print(self.superview!.subviews)
        clickX = theEvent.locationInWindow.x
        clickY = theEvent.locationInWindow.y
        offsetX = clickX - firstClick.x
        offsetY = clickY - firstClick.y
        
        self.frame = CGRectMake(offsetX + firstFrame.x, offsetY + firstFrame.y, viewLength, viewHeight)
    }
    
    override func mouseUp(theEvent: NSEvent)
    {
        
        Swift.print(clickX)
        Swift.print(clickY)
        
        if groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).0
        {
            if(groups.getSubviewSnap(groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1) == false)
            {
                let subviewarrayloc = groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1
                let i = groups.getCoordsOfSubview(subviewarrayloc).x
                let h = groups.getCoordsOfSubview(subviewarrayloc).y
                let change = groups.doDaSnap(CGPointMake(self.frame.midX, self.frame.midY)).1
                groups.setSubviewSnap(change, value: true)
                groups.subviewArray[subviewarrayloc].setStudent(student)
                self.frame = CGRectMake(i, h, viewLength, viewHeight)
            }
            else
            {
                self.frame = CGRectMake(0, 0, viewLength, viewHeight)
            }
        }
    }
}