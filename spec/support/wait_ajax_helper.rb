module WaitAjax
  def wait_url(url)
    start = Time.now.tv_sec
    until is_not_over_limit(url, Capybara.default_max_wait_time, start); end
  end

  private

  def is_not_over_limit(url, limit_sec, start)
    matched = current_path == url
    raise StandardError, 'WaitHelperError: wait timeout' if (Time.now.tv_sec - start) >= limit_sec

    matched
  end
end
