$(document).ready(function(){
    $("#projects").treeview({
        toggle: function() {
            console.log("%s was toggled.", $(this).find(">span").text());
        }
    }); 
}
