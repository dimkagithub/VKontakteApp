//
//  LoginFormController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 04.12.2020.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var firstDot: UIView!
    @IBOutlet weak var secondDot: UIView!
    @IBOutlet weak var thirdDot: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func loginButtonPressed(_ sender: Any) {
        animateDots()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            if self.checkUserData() {
                self.performSegue(withIdentifier: "MainSegue", sender: nil)
            } else {
                self.showLoginError()
            }
        }
    }
    @IBAction func logoButtonAction(_ sender: Any) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.stiffness = 350.0
        animation.duration = 0.7
        imageView.layer.add(animation, forKey: nil)
    }
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        count = 0
        firstDot.layer.cornerRadius = firstDot.bounds.height / 2
        secondDot.layer.cornerRadius = secondDot.bounds.height / 2
        thirdDot.layer.cornerRadius = thirdDot.bounds.height / 2
        firstDot.backgroundColor = .clear
        secondDot.backgroundColor = .clear
        thirdDot.backgroundColor = .clear
        animateAppearing()
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        firstDot.backgroundColor = .clear
        secondDot.backgroundColor = .clear
        thirdDot.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

//    Если необходимо убрать задержку индикатора загрузки, нужно удалить Segue и протянуть связь с кнопки.
//
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        // Проверяем данные
//        let checkResult = checkUserData()
//        // Если данные не верны, покажем ошибку
//        if !checkResult {
//            showLoginError()
//        }
//        // Вернем результат
//        return checkResult
//    }
    
    func checkUserData() -> Bool {
        loginInput.text = "admin"
        passwordInput.text = "123456"
        guard let login = loginInput.text, let password = passwordInput.text else { return false }
        if login == "admin" && password == "123456" {
            print("Успешная авторизация")
            loginInput.text = ""
            passwordInput.text = ""
            return true
        } else {
            print("Неуспешная авторизация")
            loginInput.text = ""
            passwordInput.text = ""
            return false
        }
    }
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    func animateAppearing() {
        self.loginInput.transform = CGAffineTransform(translationX: -self.view.bounds.height / 2, y: 0)
        self.loginLabel.transform = CGAffineTransform(translationX: -self.view.bounds.height / 2, y: 0)
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.loginInput.transform = .identity
            self.loginLabel.transform = .identity
        }, completion: nil)
        
        self.passwordInput.transform = CGAffineTransform(translationX: self.view.bounds.height / 2, y: 0)
        self.passwordLabel.transform = CGAffineTransform(translationX: self.view.bounds.height / 2, y: 0)
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.passwordInput.transform = .identity
            self.passwordLabel.transform = .identity
        }, completion: nil)
        
        loginButton.transform = CGAffineTransform(translationX: 0, y: 300)
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: { self.loginButton.transform = .identity
        }, completion: nil)
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.stiffness = 350
        animation.duration = 1.0
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateDots() {
        UIView.animate(withDuration: 0.5, animations: {
            self.firstDot.backgroundColor = .white
            self.firstDot.alpha = 0
        }) { _ in
            self.firstDot.alpha = 1
            UIView.animate(withDuration: 0.5, animations: {
                self.secondDot.backgroundColor = .white
                self.secondDot.alpha = 0
            }) { _ in
                self.secondDot.alpha = 1
                UIView.animate(withDuration: 0.5, animations: {
                    self.thirdDot.backgroundColor = .white
                    self.thirdDot.alpha = 0
                }) { _ in
                    self.thirdDot.alpha = 1
                    if self.count < 3 {
                        self.count += 1
                        self.animateDots()
                    }
                }
            }
        }
    }
}
