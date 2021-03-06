module TorrentEntities
  class CheckDownloadingWorker
    include Sidekiq::Worker

    sidekiq_options lock: :until_executed, on_conflict: :log, queue: :default

    def perform(torrent_entity_id)
      torrent_entity = TorrentEntity.find_by(id: torrent_entity_id)
      return unless torrent_entity

      CheckDownloading.call(torrent_entity)
    end
  end
end
