// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(
  function(){

    $("#amazon-items").find('.post input').click(
      function(){
        FB.login(function(response){
                 },
                 { perms: 'publish_stream, offline_access' }
                );
      }
    );

  }
);
