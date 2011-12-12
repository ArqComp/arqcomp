//got// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'


(function () {
    function removeItem(item, arr) {
        for (var i = arr.length; i--;) {
            if (arr[i] === item) {
                arr.splice(i, 1);
            }
        }
        return arr;
    }
    if (WYMeditor && WYMeditor.XhtmlValidator._tags.param.attributes) {

        WYMeditor.XhtmlValidator._tags.embed = {
            "attributes":[
            "allowscriptaccess",
            "allowfullscreen",
            "height",
            "src",
            "type",
            "width"
            ]
        };

        WYMeditor.XhtmlValidator._tags.param.attributes = {
            '0':'name',
            '1':'type',
            'valuetype':/^(data|ref|object)$/,
            '2':'valuetype',
            '3':'value'
        };

        WYMeditor.XhtmlValidator._tags.iframe = {
            "attributes":[
            "allowfullscreen",
            "width",
            "height",
            "src",
            "title",
            "frameborder"
            ]
        };

        // Override the XhtmlSaxListener to allow param, embed and iframe.
        //
        // We have to do an explicit override
        // of the function instead of just changing the startup parameters
        // because those are only used on creation, and changing them after
        // the fact won't affect the existing XhtmlSaxListener
        var XhtmlSaxListener = WYMeditor.XhtmlSaxListener;
        WYMeditor.XhtmlSaxListener = function () {
            var listener = XhtmlSaxListener.call(this);
            // param, embed and iframe should be inline tags so that they can
            // be nested inside other elements
            removeItem('param', listener.block_tags);
            listener.inline_tags.push('param');
            listener.inline_tags.push('embed');
            listener.inline_tags.push('iframe');

            return listener;
        };

        WYMeditor.XhtmlSaxListener.prototype = XhtmlSaxListener.prototype;
    }
})();



var dialog = $(
          '<div style="display:none;">\n\
               <div id="content-message" style="padding: 10px;">\n\
                <h1>Digite o código do vídeo do youtube que fica depois do ?v=</h1>\n\
                <form>\n\
                   <label for="videoUrl">Código:</label>\n\
                   <input id="videoUrl" value=""/>\n\
                   <label for="videoWidth">Largura:</label>\n\
                   <input id="videoWidth" value="560"/>\n\
                    <label for="videoHeight">Altura:</label>\n\
                   <input id="videoHeight" value="315"/>\n\
                   <br>\n\
                 </form>\n\
                <div id="invalidMessage">\n\
                    Código inválido\n\
                </div>\n\
                </div>\n\
               \n\
            </div>//'
        ).appendTo('body');
//var dialog = $('#youtube-form');
//$("body").append(dialog);
     

var custom_wymeditor_boot_options = {
    containersItems: [
        {'name': 'h1', 'title':'Heading_1', 'css':'wym_containers_h1'}
        , {'name': 'h2', 'title':'Heading_2', 'css':'wym_containers_h2'}
        , {'name': 'h3', 'title':'Heading_3', 'css':'wym_containers_h3'}
        , {'name': 'h4', 'title':'Heading_4', 'css':'wym_containers_h4'}
        , {'name': 'p', 'title':'Paragraph', 'css':'wym_containers_p'}
    ]
    ,toolsItems: [
        {'name': 'Bold', 'title': 'Bold', 'css': 'wym_tools_strong'}
        ,{'name': 'Italic', 'title': 'Emphasis', 'css': 'wym_tools_emphasis'}
        ,{'name': 'Youtube', 'title': 'Youtube', 'css': 'wym_tools_youtube'}
        ,{'name': 'InsertUnorderedList', 'title': 'Unordered_List', 'css': 'wym_tools_unordered_list'}
        ,{'name': 'InsertOrderedList', 'title': 'Ordered_List', 'css': 'wym_tools_ordered_list'}
        /*,{'name': 'Indent', 'title': 'Indent', 'css': 'wym_tools_indent'}
        ,{'name': 'Outdent', 'title': 'Outdent', 'css': 'wym_tools_outdent'}
        ,{'name': 'Undo', 'title': 'Undo', 'css': 'wym_tools_undo'}
        ,{'name': 'Redo', 'title': 'Redo', 'css': 'wym_tools_redo'}*/
        ,{'name': 'CreateLink', 'title': 'Link', 'css': 'wym_tools_link'}
        ,{'name': 'Unlink', 'title': 'Unlink', 'css': 'wym_tools_unlink'}
        ,{'name': 'InsertImage', 'title': 'Image', 'css': 'wym_tools_image'}
        ,{'name': 'InsertTable', 'title': 'Table', 'css': 'wym_tools_table'}
        //,{'name': 'Paste', 'title': 'Paste_From_Word', 'css': 'wym_tools_paste'}
        ,{'name': 'ToggleHtml', 'title': 'HTML', 'css': 'wym_tools_html'}
    ],postInit: function(wym) {
        
        
        // register loaded
        wymeditors_loaded += 1;

        // fire loaded if all editors loaded
        if(WYMeditor.INSTANCES.length == wymeditors_loaded){
            $('.wym_loading_overlay').remove();

            

            // load any functions that have been registered to happen onload.
            // these will have to be registered BEFORE postInit is fired (which is fairly quickly).
            for(i=0; i < WYMeditor.onload_functions.length; i++) {
                WYMeditor.onload_functions[i]();
            }
        }

        $(wym._iframe).contents().find('body').addClass('wym_iframe_body');

        $('.field.hide-overflow').removeClass('hide-overflow').css('height', 'auto');
        
        $('div.wym_box_'+wym._index+' li.wym_tools_youtube a').click(function(){
                $("#invalidMessage").hide();
                dialog.dialog({ 
                    title: "Escolha o Vídeo"
                    ,buttons: { 
                        "Ok": function() { 
                            var matches = $('#videoUrl').val().match(/^http:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=(\w+))(?:\S+)?$/);
                            if (matches) {
                                wym.insert('<iframe width="'+$('#videoWidth').val()+'" height="'+$('#videoHeight').val()+'" src="http://www.youtube.com/embed/'+matches[1]+'" frameborder="0" allowfullscreen></iframe>'); 
                                $(this).dialog("close");
                            } else {
                                wym.insert('<iframe width="'+$('#videoWidth').val()+'" height="'+$('#videoHeight').val()+'" src="http://www.youtube.com/embed/'+$('#videoUrl').val()+'" frameborder="0" allowfullscreen></iframe>'); 
//                                $("#invalidMessage").show();
                                $(this).dialog("close");
                            }   

                        }, 
                        "Cancel": function() { 
                            $(this).dialog("close");
                        }
                    } 
                });
                return false;
            });
    
    }
    
 

};// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'

