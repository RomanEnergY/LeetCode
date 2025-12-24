//
//  MainViewController.swift
//  LeetCode
//
//  Created by ZverikRS on 23.05.2025.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array: [LeetCodeSolutionRunProtocol] = [
            TwoSum(),
            AddTwoNumbers(),
            LengthOfLongestSubstring(),
            FindMedianSortedArrays()
        ]
        
        array.forEach { $0.run() }
    }
}
