// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@nathanvda/cocoon"
import  "jquery"
import * as bootstrap from "bootstrap"


$(document).ready(function() {
  $('body').on('keyup', '.price, .quantity', function() {
    var raw = $(this).closest('.row');
    var price = raw.find('.price').val();
    var quantity = raw.find('.quantity').val();
    var amount = price * quantity;
    raw.find('.amount').val(amount)
    raw.find('.amount_display').text(amount);
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
        updateAddressFields(data);
      },
      error: function(xhr, status, error) {
        console.error("Error: " + error);
        resetAddressFields();
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
  $('#order_total_amount').html(total + tax);
  $('#order_tax_field').val(tax);
}

function updateAddressFields(data) {
  var city = data.city || '';
  var state = data.state || '';
  var area = data.area || '';

  $('#city').val(city);
  $('#state').val(state);
  $('#area').val(area);
  $('#city_display').text(city);
  $('#state_display').text(state);
  $('#area_display').text(area);
}

function resetAddressFields() {
  $('#city, #state, #area').val('');
  $('#city_display, #state_display, #area_display').text('');
}
