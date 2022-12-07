import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let usersGateway = UsersGateway.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            self?.usersGateway.login(self?.loginTextField.text ?? "", self?.passwordTextField.text ?? "") { user, error in
                if let _ = user {
                    DispatchQueue.main.async {
                        if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "MainViewController") {
                            self?.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    private func userLogged(_ user: User) {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Successfully logged in!", message: "Logged as \(user.Login)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
    }
    
    private func presentError(_ error: String) {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Error!", message: "\(error)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

