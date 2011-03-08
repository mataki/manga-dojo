$(document).ready(
  function(){
    $("#amazon-items").find('.post input').click(
      function(){
        var $this = $(this);
        FB.login(function(response){
                   if (response.perms) {
                     $this.parents("form").submit();
                   } else {
                     alert('You must allow to access Facebook data from manga-dojo.');
                   }
                 },
                 { perms: 'publish_stream, offline_access' }
                );
        return false;
      }
    );
  }
);
