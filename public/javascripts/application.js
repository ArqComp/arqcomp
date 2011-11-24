$(document).ready(function(){
    $(".page-call").html($("#page-call-default").html());
    $(".page-call-item").hover(function(){
       $(".page-call").html($("#page-call-"+this.id).html());
    });
    $(".page-call-item").mouseleave(function(){
       $(".page-call").html($("#page-call-default").html());
    });
    
    $(".project-content").hide();
    $(".project").click(function(){
        $("#"+this.id+"-content").toggle();
    });
    
    $('.unfold').each(function(e,v){
        $("#project-"+v.id+"-content").show(); 
    });
});
