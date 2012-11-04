jQuery(function($) {
  $('#deployment_project_id').change(function() {
    var loc = window.location.href;
    loc = loc.replace(/\?.*$/, '') + '?deployment[project_id]=' + $(this).val();
    window.location.href = loc; 
  });
});
