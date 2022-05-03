//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateNavBar()
    }
    
    // MARK: - IBActions
    @IBAction func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    func setupViews() {
        
        let cornerRadius: CGFloat = 8.0
        chatButton.layer.cornerRadius = cornerRadius
        loginButton.layer.cornerRadius = cornerRadius
        animationButton.layer.cornerRadius = cornerRadius
        
        chatButton.imageEdgeInsets = .init(top: 0, left: 22, bottom: 0, right: 0)
        chatButton.titleEdgeInsets = .init(top: 0, left: 38, bottom: 0, right: 0)
        
        loginButton.imageEdgeInsets = .init(top: 0, left: 22, bottom: 0, right: 0)
        loginButton.titleEdgeInsets = .init(top: 0, left: 38, bottom: 0, right: 0)
        
        animationButton.imageEdgeInsets = .init(top: 0, left: 22, bottom: 0, right: 0)
        animationButton.titleEdgeInsets = .init(top: 0, left: 38, bottom: 0, right: 0)
    }
    
    func updateNavBar() {
        
        title = "Coding Tasks"
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exists.") }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "HeaderButtonColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = navBar.standardAppearance
        navBar.tintColor = UIColor.white
    }
}



