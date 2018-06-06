include AsynchronousHelper
module Select2Helper
  def select2_remote(value, attrs)
    page.find(attrs[:from] + " + .select2 .select2-selection").click
    page.find(".select2-container--open .select2-search__field").set(value)
    wait_until_ajax_completes
    page.find(".select2-container--open li", text: value).click
  end
end