// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require popper
//= require bootstrap
//= require turbolinks
//= require dataTables.bootstrap4.min
//= require jquery.dataTables.min
//= require impact_backhand/additional-methods
//= require impact_backhand/bootstrap/bootstrap.bundle
//= require impact_backhand/bootstrap/bootstrap.bundle.min
//= require impact_backhand/bootstrap/bootstrap
//= require impact_backhand/bootstrap/bootstrap.min
//= require impact_backhand/chart/core
//= require impact_backhand/chart/Chart
//= require impact_backhand/chart/Chart.min
//= require impact_backhand/chart/charts-custom
//= require impact_backhand/chart/Chart.bundle.min
//= require impact_backhand/chart/Chart.bundle
//= require impact_backhand/chart/charts-home
//= require impact_backhand/front
//= require impact_backhand/grasp_mobile_progress_circle-1.0.0.min
//= require impact_backhand/jquery/jquery.mCustomScrollbar.concat.min
//= require impact_backhand/jquery/jquery.mCustomScrollbar
//= require impact_backhand/jquery/jquery.min
//= require impact_backhand/jquery/jquery.slim
//= require impact_backhand/jquery/jquery.slim.min
//= require impact_backhand/jquery/jquery.validate
//= require impact_backhand/jquery/jquery.validate.min
//= require impact_backhand/jquery/jquery.cookie
//= require impact_backhand/popper/popper-utils
//= require impact_backhand/popper/popper-utils.min
//= require impact_backhand/popper/popper
//= require impact_backhand/popper/popper.min
//= require_tree .
$(document).ready(function() {
    $('#example').DataTable();
} );