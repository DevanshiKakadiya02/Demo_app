// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@nathanvda/cocoon"
import  "jquery"
import * as bootstrap from "bootstrap"


$(document).ready(function() {
  $('body').on('keyup', '.price', function(){
    var raw = $(this).closest('.Row');
    var price = $(this).val();
    var quantity = raw.find('.quantity').val();
    raw.find('.amount').val(price * quantity)
    console.log('quantity', quantity);
    console.log('price', price);
  });

  $('body').on('keyup', '.quantity', function(){
    var raw = $(this).closest('.Row');
    var quantity = $(this).val();
    var price = raw.find('.price').val();
    raw.find('.amount').val(price * quantity)
    console.log('quantity', quantity);
    console.log('price', price);
  });
});