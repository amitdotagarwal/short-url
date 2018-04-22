json.extract! url, :created_at, :updated_at
json.url shortened_path(url.short_url, format: :json)
json.extract!  url, :original_url 
json.impressions @url.impressions, :ip_address, :created_at
