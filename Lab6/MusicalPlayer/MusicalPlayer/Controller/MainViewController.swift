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
    
    private(set) var current: GatewayProtocol!
    
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
    
    @IBAction func addClicked(_ sender: Any) {
        switch self.entitySegment.selectedSegmentIndex {
        case 0:
            Task { [weak self] in
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "AddTrackViewController") as? AddTrackViewController {
                    let artists = ArtistsGateway()
                    let albums = AlbumsGateway()
                    let genres = GenresGateway()
                    await artists.fetch()
                    await albums.fetch()
                    await genres.fetch()
                    artists.entities.bind({ artists in
                        vc.availableArtists = artists.map({ $0 as! Artist })
                    })
                    albums.entities.bind { albums in
                        vc.availableAlbums = albums.map({ $0 as! Album })
                    }
                    genres.entities.bind { genres in
                        vc.availableGenres = genres.map({ $0 as! Genre })
                    }
                    vc.main = self
                    self?.present(vc, animated: true)
                }
            }
        case 1:
            Task { [weak self] in
                let ac = UIAlertController(title: "Add artist", message: nil, preferredStyle: .alert)
                ac.addTextField()
                ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
                    if let artistsGateway = self?.current as? ArtistsGateway {
                        artistsGateway.addArtist(ac.textFields!.first!.text ?? "Unknown")
                    }
                }))
                present(ac, animated: true)
            }
        case 2:
            Task { [weak self] in
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "AddAlbumViewController") as? AddAlbumViewController {
                    vc.mainVC = self
                    self?.present(vc, animated: true)
                }
            }
        case 3:
            return
        case 4:
            Task { [weak self] in
                let ac = UIAlertController(title: "Add genre", message: nil, preferredStyle: .alert)
                ac.addTextField()
                ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
                    if let genresGateway = self?.current as? GenresGateway {
                        genresGateway.addGenre(ac.textFields!.first!.text ?? "Unknown")
                    }
                }))
                self?.present(ac, animated: true)
            }
        default:
            return
        }
    }
    
    func update(_ indexPath: IndexPath, _ value: String) {
        Task { [weak self] in
            await self?.current.update(self?.current.entities.value[indexPath.row].id ?? -1, value)
        }
    }
    
    func delete(_ indexPath: IndexPath) {
        Task { [weak self] in
            await self?.current.delete(self?.current.entities.value[indexPath.row].id ?? -1)
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
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if UsersGateway.shared.user!.Permission > 2 {
            let config = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "Edit", handler: { _, _, _ in
                let ac = UIAlertController(title: "Update", message: nil, preferredStyle: .alert)
                ac.addTextField()
                ac.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self] _ in
                    self?.update(indexPath, ac.textFields!.first!.text ?? "Unknown")
                }))
                self.present(ac, animated: true)
            })])
            return config
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if UsersGateway.shared.user!.Permission > 2{
            let config = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self] _, _, _ in
                self?.delete(indexPath)
            })])
            return config
        }
        return nil
    }
    
}
