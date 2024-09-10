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
    raw.find('.amount').val(price * quantity);
    tax();
  });

  $('body').on('keyup', '.quantity', function(){
    var raw = $(this).closest('.Row');
    var quantity = $(this).val();
    var price = raw.find('.price').val();
    raw.find('.amount').val(price * quantity);
    tax();
  });
});

function tax() {
  var total = 0;
  $('.amount').each(function() {
    total += parseFloat($(this).val()) || 0;
  });

  var tax = parseInt(total * 0.10);
  console.log('Total total:', total);
  console.log('tax', tax);
  $('#order_total').html(total);
  $('#order_tax').html(tax);
  $('#order_total_amount').html(total + total);
  $('#order_tax_field').val(tax);
}
