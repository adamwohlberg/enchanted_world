$(document).ready(function() {
  $('#setting_search_term').select2({
    theme: 'bootstrap',
    minimumInputLength: 2,
    placeholder: 'Restaurants',
    ajax: {
      url: $('#setting_search_term').data('url'),
      dataType: 'json',
      delay: 250,
      processResults: function (data) {
        return { results: data }
      }
    }
  });
});
