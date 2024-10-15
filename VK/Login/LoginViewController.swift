import UIKit

protocol LoginViewProtocol: AnyObject {
    func showLoginError()
}

class LoginViewController: UIViewController {
    var presenter: LoginPresenterProtocol?
    let module = LoginModule()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        
        //жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        //присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    /// проверка пароля перед переходом
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        let checkPassword = presenter?.checkPassword(login: login, password: password)
        if !(checkPassword ?? false) {
            showLoginError()
        }
        return checkPassword ?? false
    }
    
    /// когда клавиатура появлятся
    @objc func keyboardWasShown(notification: Notification) {
        
        //получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets =   UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    /// когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notifikation: Notification) {
        //устанавливем отступ внизу UIScrollView равный 0
        let contentInserts = UIEdgeInsets.zero
        scrollView?.contentInset = contentInserts
        scrollView?.scrollIndicatorInsets = contentInserts
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //подписываемся на два уведомления, одно пиходит при появлении клавиатуры
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        //второе когда она пропадает
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notifikation:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}

extension LoginViewController: LoginViewProtocol {
    /// Cообщение о неверном логине/пароле
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Uncorrect login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
