//
//  FireBaseLoginFormController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 12.03.2021.
//

import UIKit
import FirebaseAuth

class FireBaseLoginFormController: UIViewController {
    
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        guard
            let email = loginLabel.text, let password = passwordLabel.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func RegistrationButton(_ sender: UIButton) {
        guard
            let email = loginLabel.text, let password = passwordLabel.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    static let segueIdentifier = "MainTBSegue"
    private var listener: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listener = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard
                user != nil else { return }
            self?.loginLabel.text = ""
            self?.passwordLabel.text = ""
            self?.performSegue(withIdentifier: FireBaseLoginFormController.segueIdentifier, sender: nil)
        }
    }
}
