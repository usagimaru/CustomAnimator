//
//  Animator.swift
//  CustomAnimator
//
//  Created by M.Satori on 16.06.28.
//  Copyright © 2016年 usagimaru. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
	var presenting: Bool = true
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		// 実質使われない
		return 0.0
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		if presenting == true {
			presentViewController(transitionContext)
		}
		else {
			dismissViewController(transitionContext)
		}
	}
	
	private func presentViewController(transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView()
		
		let fromNavi = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! UINavigationController
		let fromVC = fromNavi.viewControllers.first as! ViewController
		let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SecondViewController
		
		let headerView = fromVC.headerView
		
		// なぜか直接 frame を操作できないので1枚ビューを挟む
		let headerTempView = UIView(frame: headerView.bounds)
		headerTempView.backgroundColor = UIColor.clearColor()
		headerTempView.addSubview(headerView)
		
		containerView!.addSubview(toVC.view)
		containerView!.addSubview(headerTempView)
		
		toVC.view.y = containerView!.height
		headerTempView.y = containerView!.height - headerTempView.height
		
		UIView.performSystemAnimation(UISystemAnimation.Delete,
		                              onViews: [],
		                              options: UIViewAnimationOptions(rawValue: 0),
		                              animations: {
										toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
										headerTempView.y = 20
			},
		                              completion: {(finished: Bool) in
										toVC.addHeaderView(headerView)
										headerTempView.removeFromSuperview()
										
										transitionContext.completeTransition(true)
		})
		
	}
	
	private func dismissViewController(transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView()
		
		let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SecondViewController
		let toNavi = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UINavigationController
		let toVC = toNavi.viewControllers.first as! ViewController
		
		let headerView = fromVC.headerView
		
		containerView!.addSubview(toNavi.view)
		containerView!.addSubview(fromVC.view)
		containerView!.addSubview(headerView)
		
		headerView.y = 20
		
		UIView.performSystemAnimation(UISystemAnimation.Delete,
		                              onViews: [],
		                              options: UIViewAnimationOptions(rawValue: 0),
		                              animations: {
										headerView.y = containerView!.height - headerView.height
										fromVC.view.y = containerView!.height
			},
		                              completion: {(finished: Bool) in
										toVC.addHeaderView(headerView)
										
										transitionContext.completeTransition(true)
		})
		
	}
}
