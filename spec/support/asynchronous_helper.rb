require "timeout"
module AsynchronousHelper

  def wait_until(timeout=Capybara.default_max_wait_time, opts = {})
    Timeout.timeout(timeout) do
      interval = opts[:sleep_interval] || 0.1
      until(value = yield) do
        sleep(interval)
      end
      value
    end
  end

  def wait_until_ajax_completes(timeout=Capybara.default_max_wait_time)
    wait_until(timeout) do
      page.evaluate_script('!jQuery.active')
    end
  end
end