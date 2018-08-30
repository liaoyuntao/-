var fullTools =
    [ 'formatblock', 'fontname', 'fontsize', 'lineheight', '|', 'forecolor', 'hilitecolor', '|', 'bold', 'italic','underline', 'strikethrough', '|',
        'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', '|',
        'insertorderedlist', 'insertunorderedlist', '|',
        'emoticons', 'image', 'insertfile', 'hr', '|', 'link', 'unlink', '/',
        'undo', 'redo', '|', 'selectall', 'cut', 'copy', 'paste', '|', 'plainpaste', 'wordpaste', '|', 'removeformat', 'clearhtml','quickformat', '|',
        'indent', 'outdent', 'subscript', 'superscript', '|',
        'table', 'code', '|', 'pagebreak', 'anchor', '|',
        'fullscreen', 'source', 'preview', 'about'];

var bugTools =
    [ 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic','underline', '|',
        'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', '|',
        'emoticons', 'image', 'code', 'link', '|', 'removeformat','undo', 'redo', 'fullscreen', 'source', 'about'];


var keditor,doc,cmd,frame;
function initKindeditor(afterInit)
{
    // $(':input[type=submit]').next('#uid').remove();
    // $(':input[type=submit]').after("<input type='hidden' id='uid' name='uid' value=" + kuid + ">");
    var nextFormControl = 'input:not([type="hidden"]), textarea:not(.ke-edit-textarea), button[type="submit"], select';
    $.each(editor.id, function(key, editorID)
    {
        editorTool = simpleTools;
        if(editor.tools == 'bugTools')  editorTool = bugTools;
        if(editor.tools == 'fullTools') editorTool = fullTools;

        K = KindEditor, $editor = $('#' + editorID);
        var placeholderText = $editor.attr('placeholder');
        if(placeholderText == undefined) placeholderText = '';
        var pasted;
        var options =
            {
                cssPath:['../../statics/plugins/kindeditor/css/min.css'],
                width:'100%',
                height:'600px',
                minHeight:'400px',
                items:editorTool,
                filterMode: true,
                bodyClass:'article-content',
                urlType:'relative',
                pasteType:2,
                uploadJson:baseURL+"sys/oss/uploadFile",
                allowFileManager:true,
                langType:'zh_CN',
                afterChange: function(){$editor.change().hide();},
                afterCreate : function()
                {
                     frame = this.edit;
                     doc   = this.edit.doc;
                    var cmd   = this.edit.cmd;
                    pasted    = true;
                    if(!K.WEBKIT && !K.GECKO)
                    {
                        var pasted = false;
                        $(doc.body).bind('paste', function(ev)
                        {
                            pasted = true;
                            return true;
                        });
                        setTimeout(function()
                        {
                            $(doc.body).bind('keyup', function(ev)
                            {
                                if(pasted)
                                {
                                    pasted = false;
                                    return true;
                                }
                                if(ev.keyCode == 86 && ev.ctrlKey) alert('您的浏览器不支持粘贴图片！');
                            })
                        }, 10);
                    }
                    if(pasted && placeholderText.indexOf('可以在编辑器直接贴图。') < 0)
                    {
                        if(placeholderText) placeholderText += '<br />';
                        placeholderText += ' 可以在编辑器直接贴图。';
                    }

                    if(K.WEBKIT)
                    {
                        $(doc.body).bind('paste', function(ev)
                        {
                            var $this    = $(this);
                            var original = ev.originalEvent;
                            var file     = original.clipboardData.items[0].getAsFile();
                            if(file){
                            	                            	  
                            	  uoloadFile(file,function(url){
                                      cmd.inserthtml('<img src="'+url+'" />');
                                  })
                            }
                        });
                    }
                    /* Paste in firfox and other firfox.*/
                    else
                    {
                        K(doc.body).bind('paste', function(ev)
                        {
                            setTimeout(function()
                            {
                                var html = K(doc.body).html();
                                if(html.search(/<img src="data:.+;base64,/) > -1)
                                {
                                    var imgs=document.getElementsByClassName('ke-edit-iframe')[0].contentDocument.getElementsByTagName('img');
                                    for(var i=0;i<imgs.length;i++){
                                        var img=imgs[i], data=img.getAttribute('src');
                                        if(data.indexOf('base64')>0){
                                              var file=convertBase64UrlToBlob(data);
	                                      	  uoloadFile(file,function(url){
	                                              img.parentNode.removeChild(img);
	                                              cmd.inserthtml('<img src="'+url+'" />');
	                                          });
                                        }
                                    }
                                }
                            }, 80);
                        });
                    }
                    /* End */

                    /* Paste in chrome.*/
                    /* Code reference from http://www.foliotek.com/devblog/copy-images-from-clipboard-in-javascript/. */


                    /* Add for placeholder. */
                    $(this.edit.doc).find('body').after('<span class="kindeditor-ph" style="width:100%;color:#888; padding:5px 5px 5px 7px; background-color:transparent; position:absolute;z-index:10;top:2px;border:0;overflow:auto;resize:none; font-size:13px;"></span>');
                    var $placeholder = $(this.edit.doc).find('.kindeditor-ph');
                    $placeholder.html(placeholderText);
                    $placeholder.css('pointerEvents', 'none');
                    $placeholder.click(function(){frame.doc.body.focus()});
                    if(frame.html() != '') $placeholder.hide();
                },
                afterFocus: function()
                {
                    var frame = this.edit;
                    var $placeholder = $(frame.doc).find('.kindeditor-ph');
                    if($placeholder.size() == 0)
                    {
                        setTimeout(function(){$(frame.doc).find('.kindeditor-ph').hide();}, 50);
                    }
                    else
                    {
                        $placeholder.hide();
                    }
                    $editor.prev('.ke-container').addClass('focus');
                },
                afterBlur: function()
                {
                    this.sync();
                    $editor.prev('.ke-container').removeClass('focus');
                    var frame = this.edit;
                    if(K(frame.doc.body).html() == '') $(frame.doc).find('.kindeditor-ph').show();
                },
                afterTab: function(id)
                {
                    var $next = $editor.next(nextFormControl);
                    if(!$next.length) $next = $editor.parent().next().find(nextFormControl);
                    if(!$next.length) $next = $editor.parent().parent().next().find(nextFormControl);
                    $next = $next.first().focus();
                    var keditor = $next.data('keditor');
                    if(keditor) keditor.focus();
                    else if($next.hasClass('chosen')) $next.trigger('chosen:activate');
                }
            };
        try
        {
            if(!window.editor) window.editor = {};
            keditor = K.create('#' + editorID, options);
            window.editor['#'] = window.editor[editorID] = keditor;
            $editor.data('keditor', keditor);
        }
        catch(e){}
    });
    if($.isFunction(afterInit)) afterInit();
}

function uoloadFile(file,callback){
	  var ajaxload=window.layer.load(1, {
          shade: [0.5, '#fff']
      });
	 var formData = new FormData();
     formData.append("imgFile", file); 
	 $.ajax({
         url:baseURL+"sys/oss/uploadFile",
         type: "POST",
         data: formData,
         contentType: false,
         processData: false,
         success: function (data) {
        	 window.layer.close(ajaxload);
             if (data.error == 0) {
            	 callback(data.url)
             }
         },
         error: function () {
        	 window.layer.close(ajaxload);
         }
     });
	 
}

/*------------------------------------------------------------------------------------------------------*/


function editorsave(){
	
    var postData={};
        postData.context=keditor.text();
        postData.context_html=keditor.html();
        postData.showLoading='1';
    // TODO 修改节点内容
        console.log(postData);

}

$(document).ready(function(){
    initKindeditor();
});

