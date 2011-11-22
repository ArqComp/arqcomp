$(document).ready(function(){
    $(".project-content").hide();
    $(".project").click(function(){
        $("#"+this.id+"-content").toggle();
    });
    
    $('.unfold').each(function(e,v){
        $("#project-"+v.id+"-content").show(); 
    });
});
