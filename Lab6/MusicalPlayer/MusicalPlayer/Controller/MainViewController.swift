import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var entitySegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    
    private var gateways: [Int: GatewayProtocol] = [
        0: TracksGateway(),
        1: ArtistsGateway(),
        2: AlbumsGateway(),
        3: PlaylistsGateway(),
        4: GenresGateway()
    ]
    
    private var current: GatewayProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
        self.current = self.gateways[self.entitySegment.selectedSegmentIndex]
        Task { [weak self] in
            await self?.current.fetch()
        }
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.current.entities.bind { [weak self] _ in
            Task {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
        self.current = self.gateways[self.entitySegment.selectedSegmentIndex]
        Task { [weak self] in
            await self?.current.fetch()
        }
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.current.entities.bind { [weak self] _ in
            Task {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func selectionDidChange(_ sender: Any) {
        guard let current = self.gateways[self.entitySegment.selectedSegmentIndex] else { return }
        self.current = current
        Task { [weak self] in
            await self?.current.fetch()
            self?.current.entities.bind({ _ in
                Task {
                    self?.tableView.reloadData()
                }
            })
        }
        if UsersGateway.shared.user!.Permission < 2 {
            self.addButton.isHidden = self.entitySegment.selectedSegmentIndex != 3
        }
    }
    

}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.current.entities.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let config = self.current.entities.value[indexPath.row].cellConfiguration()
        cell.setup(config.title, config.details, self.current.associatedImage())
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task { [weak self] in
            let entity = self?.current.entityForIndexPath(indexPath)
            if entity is Track {
                let config = entity?.cellConfiguration()
                let ac = UIAlertController(title: config?.title ?? "", message: config?.details ?? "", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
            if entity is Artist {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "ArtistViewController") as? ArtistViewController {
                    vc.artist = entity as? Artist
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
            if entity is Album {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "TracklistViewController") as? TracklistViewController {
                    vc.album = entity as? Album
                    vc.playlist = nil
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
            if entity is Playlist {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "TracklistViewController") as? TracklistViewController {
                    vc.album = nil
                    vc.playlist = entity as? Playlist
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
            if entity is Genre {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "GenreViewController") as? GenreViewController {
                    vc.genre = entity as? Genre
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}
