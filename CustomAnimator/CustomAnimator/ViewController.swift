//
//  ViewController.swift
//  CustomAnimator
//
//  Created by M.Satori on 16.06.28.
//  Copyright © 2016年 usagimaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	@IBOutlet weak var headerParentView: UIView!
	var headerView = HeaderView.fromNib()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		addHeaderView(headerView)
		headerView.layer.borderColor = UIColor.redColor().CGColor
		headerView.layer.borderWidth = 1
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	// MARK: - Navigation
	/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	*/
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		headerView.frame = headerParentView.bounds
	}
	
	
	internal func headerTapped(sender :AnyObject) {
		let vc = SecondViewController.fromStoryboard()
		vc.transitioningDelegate = self
		presentViewController(vc, animated: true, completion: nil)
	}
	
	
	func addHeaderView(headerView: HeaderView) {
		headerView.target = self
		headerView.action = #selector(headerTapped(_:))
		headerParentView.addSubview(headerView)
		
		headerView.frame = headerParentView.bounds
		headerView.autoresizingMask = [.FlexibleWidth]
	}
	
	
	func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		let animator = Animator()
		animator.presenting = true
		return animator
	}
	
	
	// TODO: https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CustomizingtheTransitionAnimations.html#//apple_ref/doc/uid/TP40007457-CH16-SW5
//	func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//		
//	}
//	
//	func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//		
//	}
	
}
