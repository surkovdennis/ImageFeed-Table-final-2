import UIKit

class ImagesListViewController: UIViewController {
    private struct Constants {
        static let id = String(describing: ImagesListCell.self)
    }
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: Constants.id, bundle: nil), forCellReuseIdentifier: Constants.id)
        }
    }

    private var photosName = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        photosName = Array(0..<20).map{ "\($0)" }
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageListCell = tableView.dequeueReusableCell(withIdentifier: Constants.id, for: indexPath) as? ImagesListCell else {
            return UITableViewCell()
        }
        
        let image = UIImage(named: photosName[indexPath.row])
        let date = dateFormatter.string(from: Date())
        let isLiked = indexPath.row % 2 == 0
        imageListCell.configure(image: image, date: date, isLiked: isLiked)
        
        return imageListCell
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
