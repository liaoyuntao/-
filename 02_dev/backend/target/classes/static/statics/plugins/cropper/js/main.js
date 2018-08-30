$(function () {

  'use strict';

  var console = window.console || { log: function () {} },
      $alert = $('.docs-alert'),
      $message = $alert.find('.message'),
      showMessage = function (message, type) {
        $message.text(message);

        if (type) {
          $message.addClass(type);
        }

        $alert.fadeIn();

        setTimeout(function () {
          $alert.fadeOut();
        }, 3000);
      };

  // Demo
  // -------------------------------------------------------------------------

  (function () {
	    var $image = $('.img-container > img'),
        $dataX = $('#dataX'),
        $dataY = $('#dataY'),
        options = {
          autoCropArea: 0.4,
          mouseWheelZoom: false,
          //responsive: false,
          minContainerWidth:600,
          minContainerHeight:300,
          aspectRatio: 2 / 1,
          preview: '.img-preview',
          crop: function (data) {
        	
            $dataX.val(Math.round(data.x));
            $dataY.val(Math.round(data.y));
            
          }
        };
	    $image.cropper(options);

    // Methods document.body
    $("#picture").on('click', '[data-method]', function () {
      var data = $(this).data(),
          $target,
          result;

      if (data.method) {
        data = $.extend({}, data); // Clone a new one

        if (typeof data.target !== 'undefined') {
          $target = $(data.target);

          if (typeof data.option === 'undefined') {
            try {
              data.option = JSON.parse($target.val());
            } catch (e) {
              console.log(e.message);
            }
          }
        }

        result = $image.cropper(data.method, data.option);
        if (data.method === 'getCroppedCanvas') {
        	result.id = "uploadPhoto";
          $('#picture #getCroppedCanvasModal').modal().find('.modal-body').html(result);
        }

        if ($.isPlainObject(result) && $target) {
          try {
            $target.val(JSON.stringify(result));
          } catch (e) {
            console.log(e.message);
          }
        }

      }
    }).on('keydown', function (e) {

      switch (e.which) {
        case 37:
          e.preventDefault();
          $image.cropper('move', -1, 0);
          break;

        case 38:
          e.preventDefault();
          $image.cropper('move', 0, -1);
          break;

        case 39:
          e.preventDefault();
          $image.cropper('move', 1, 0);
          break;

        case 40:
          e.preventDefault();
          $image.cropper('move', 0, 1);
          break;
      }

    });
    
    // Import image
    var $inputImage = $('#inputImage'),
        URL = window.URL || window.webkitURL,
        blobURL;

    if (URL) {
      $inputImage.change(function () {
        var files = this.files,
            file;

        if (files && files.length) {
          file = files[0];

          if (/^image\/\w+$/.test(file.type)) {
        	  console.dir($image);
            blobURL = URL.createObjectURL(file);
            $image.one('built.cropper', function () {
              URL.revokeObjectURL(blobURL); // Revoke when load complete
            }).cropper('reset', true).cropper('replace', blobURL);
            $inputImage.val('');
          } else {
            showMessage('Please choose an image file.');
          }
        }
      });
    } else {
      $inputImage.parent().remove();
    }


    // Options
    $('.docs-options :checkbox').on('change', function () {
      var $this = $(this);

      options[$this.val()] = $this.prop('checked');
      $image.cropper('destroy').cropper(options);
    });


    // Tooltips
    $('[data-toggle="tooltip"]').tooltip();

  }());
  
  (function () {
	  var $image = $('.img-container2 > img'),
      $dataX = $('#dataX2'),
      $dataY = $('#dataY2'),
      options = {
        autoCropArea: 0.4,
        mouseWheelZoom: false,
        //responsive: false,
        minContainerWidth:600,
        minContainerHeight:300,
        aspectRatio: 2 / 1,
        preview: '.img-preview',
        crop: function (data) {
      	
          $dataX.val(Math.round(data.x));
          $dataY.val(Math.round(data.y));
          
        }
      };
	    $image.cropper(options);

  // Methods document.body
  $("#listDiagam").on('click', '[data-method]', function () {
      var data = $(this).data(),
          $target,
          result;

      if (data.method) {
        data = $.extend({}, data); // Clone a new one

        if (typeof data.target !== 'undefined') {
          $target = $(data.target);

          if (typeof data.option === 'undefined') {
            try {
              data.option = JSON.parse($target.val());
            } catch (e) {
              console.log(e.message);
            }
          }
        }

        result = $image.cropper(data.method, data.option);
        if (data.method === 'getCroppedCanvas') {
        	result.id = "uploadListPhoto";
          $('#listDiagam #getCroppedCanvasModal').modal().find('.modal-body').html(result);
        }

        if ($.isPlainObject(result) && $target) {
          try {
            $target.val(JSON.stringify(result));
          } catch (e) {
            console.log(e.message);
          }
        }

      }
    }).on('keydown', function (e) {

      switch (e.which) {
        case 37:
          e.preventDefault();
          $image.cropper('move', -1, 0);
          break;

        case 38:
          e.preventDefault();
          $image.cropper('move', 0, -1);
          break;

        case 39:
          e.preventDefault();
          $image.cropper('move', 1, 0);
          break;

        case 40:
          e.preventDefault();
          $image.cropper('move', 0, 1);
          break;
      }

    });


  // Import image
  var $inputImage = $('#inputImage2'),
      URL = window.URL || window.webkitURL,
      blobURL;

  if (URL) {
    $inputImage.change(function () {
      var files = this.files,
          file;

      if (files && files.length) {
        file = files[0];

        if (/^image\/\w+$/.test(file.type)) {
        	console.dir($image);
          blobURL = URL.createObjectURL(file);
          $image.one('built.cropper', function () {
            URL.revokeObjectURL(blobURL); // Revoke when load complete
          }).cropper('reset', true).cropper('replace', blobURL);
          $inputImage.val('');
        } else {
          showMessage('Please choose an image file.');
        }
      }
    });
  } else {
    $inputImage.parent().remove();
  }


  // Options
  $('.docs-options :checkbox').on('change', function () {
    var $this = $(this);

    options[$this.val()] = $this.prop('checked');
    $image.cropper('destroy').cropper(options);
  });


  // Tooltips
  $('[data-toggle="tooltip"]').tooltip();

}());

});


