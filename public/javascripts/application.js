$(document).ready(function(){
    $(".project-content").hide();
    $(".project").click(function(){
        $("#"+this.id+"-content").toggle() 
    });
});
