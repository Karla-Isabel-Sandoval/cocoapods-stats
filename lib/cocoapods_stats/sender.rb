require 'rest'

module CocoaPodsStats
  class Sender
    API_URL = 'http://stats-cocoapods-org.herokuapp.com/api/v1/install'

    def send(targets, pod_try: false)
      REST.post(
        API_URL,
        {
          :targets => targets,
          :cocoapods_version => Pod::VERSION,
          :pod_try => pod_try,
        }.to_json,
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
      )
    rescue REST::Error => e
      UI.message "Failed to send stats:\n\n#{e}"
    end
  end
end
