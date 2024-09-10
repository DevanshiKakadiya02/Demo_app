// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@nathanvda/cocoon"
import  "jquery"
import * as bootstrap from "bootstrap"


$(document).ready(function() {
  $('body').on('keyup', '.price', function(){
    var raw = $(this).closest('.row');
    var price = $(this).val();
    var quantity = raw.find('.quantity').val();
    raw.find('.amount').val(price * quantity);
    tax();
  });

  $('body').on('keyup', '.quantity', function(){
    var raw = $(this).closest('.row');
    var quantity = $(this).val();
    var price = raw.find('.price').val();
    raw.find('.amount').val(price * quantity);
    tax();
  });

  $('body').on('keyup', '#zipcode', function(){
    var zipcode = $(this).val();
    $.ajax({
      url: '/orders/address-lookup',
      method: 'GET',
      data: { zipcode: zipcode },
      dataType: 'json',
      success: function(data) {
        if (data) {
          $('#city').val(data.city || '');
          $('#state').val(data.state || '');
          $('#area').val(data.area || '');
        } else {
          $('#city').val('');
          $('#state').val('');
          $('#area').val('');
        }
      },
      error: function(xhr, status, error) {
        console.log("Error: " + error);
        $('#city').val('');
        $('#state').val('');
        $('#area').val('');
      }
    });
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
