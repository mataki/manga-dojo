require "oauth"
require "google_spreadsheet"

class LogGss

  def self.update(arr)
    self.new.update(arr)
  end

  def insert_row
    @insert_row ||= worksheet.num_rows + 1
  end

  def update(arr)
    arr.unshift(Time.now.to_s(:db))
    arr.each_with_index do |item, index|
      worksheet[insert_row, index+1] = item
    end
    worksheet.save
  end

  def worksheet
    @worksheet ||= sheet.worksheets.first
  end

  def sheet
    @sheet ||= session.spreadsheet_by_key ENV["GOOGLE_LOG_SHEET_KEY"]
  end

  def session
    @google_session ||= GoogleSpreadsheet.login_with_oauth access_token
  end

  def consumer
    return @consumer if @consumer
    key = ENV["GOOGLE_CONSUMER_KEY"]
    secret = ENV["GOOGLE_CONSUMER_SECRET"]
    @consumer = OAuth::Consumer.new key, secret, {
      :signature_method   => 'HMAC-SHA1',
      :site               => 'https://www.google.com',
      :request_token_path => '/accounts/OAuthGetRequestToken',
      :authorize_path     => '/accounts/OAuthAuthorizeToken',
      :access_token_path  => '/accounts/OAuthGetAccessToken',
    }
  end

  def access_token
    return @access_token if @access_token
    token = ENV["GOOGLE_ACCESS_TOKEN"]
    secret = ENV["GOOGLE_ACCESS_SECRET"]
    @access_token = OAuth::AccessToken.new(consumer, token, secret)
  end
end
