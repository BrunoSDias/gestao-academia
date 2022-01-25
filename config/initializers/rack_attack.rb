class Rack::Attack
  throttle('req/ip', limit: 300, period: 2.minutes) do |req|
    req.ip
  end

  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.ip
    end
  end

  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.params['email'].to_s.downcase.gsub(/\s+/, "").presence
    end
  end
end