//
//  SecondViewController.swift
//  CustomAnimator
//
//  Created by M.Satori on 16.06.28.
//  Copyright © 2016年 usagimaru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	@IBOutlet weak var headerParentView: UIView!
	weak var headerView: HeaderView!
	
	class func fromStoryboard() -> SecondViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
	*/
	
	
	internal func headerTapped(sender :AnyObject) {
		self.transitioningDelegate = self
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	
	func addHeaderView(headerView: HeaderView) {
		self.headerView = headerView
		headerView.target = self
		headerView.action = #selector(headerTapped(_:))
		headerParentView.addSubview(headerView)
		
		headerView.frame = headerParentView.bounds
		headerView.autoresizingMask = [.FlexibleWidth]
	}
	
	
	func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		let animator = Animator()
		animator.presenting = false
		return animator
	}

}
