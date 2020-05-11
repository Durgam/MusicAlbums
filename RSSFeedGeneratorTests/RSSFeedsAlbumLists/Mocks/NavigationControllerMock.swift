//
//  NavigationControllerMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import UIKit

class NavigationControllerMock: UINavigationController {
    
    private(set) var isPushViewControllerCalled = false
    private(set) var isPopViewControllerCalled = false
    private(set) var isPopToViewControllerCalled = false
    private(set) var isPresentViewControllerCalled = false
    private(set) var isDismissViewControllerCalled = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushViewControllerCalled = true
        super.pushViewController(viewController, animated: false)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        isPopViewControllerCalled = true
        return super.popViewController(animated: false)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        isPopToViewControllerCalled = true
        return super.popToViewController(viewController, animated: false)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        isPresentViewControllerCalled = true
        super.present(viewControllerToPresent, animated: false, completion: completion)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissViewControllerCalled = true
        super.dismiss(animated: false, completion: completion)
    }
}
