//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require mustache
//= require highcharts
//= require qrcode

$(document).ready(function() {
   $('.global-flash .alert').click(function() {
      $(this).slideUp('fast');
   });


   // Fix input element click problem for login dropdown
   $('.dropdown input, .dropdown label, .dropdown-menu').click(function(e) {
      e.stopPropagation();
   });


   var timeout = null;
   var initialMargin = parseInt($(".hide-this-shit").css("margin-top"));

   $(".hide-this-shit").hover(
      function() {
         if (timeout) {
            clearTimeout(timeout);
            timeout = null;
         }
         $(this).animate({ marginTop: 0 }, 'fast');
      },
      function() {
         var menuBar = $(this);
         timeout = setTimeout(function() {
            timeout = null;
            menuBar.animate({ marginTop: initialMargin }, 'fast');
         },
         1000);
      }
   );

   $("#new_sale_item")
   .bind("ajax:success", function(e, data, xhr) {
      console.log(data);
      $('#sale-item-' + data['id']).remove();
      var newRow = $(Mustache.render('<tr id="sale-item-{{id}}"><td>{{name}} ({{product_size}})</td><td>{{price}}</td><td>{{quantity}}</td><td>{{sub_total}}</td></tr>', data));
      newRow.insertBefore("#totals");

      $("#total-bottom").html(Mustache.render("Total: {{total}}",data))
      $("#total-top").html(Mustache.render("{{total}}",data))
      $("#num_items").html(Mustache.render("{{num_items}} item(s)",data))

      $("#sale_item_product").val("");
      $('#nsi-error').remove();

   });

   $("#new_sale_item").bind("ajax:error", function(e, data, xhr) {
      console.log(data);
      $('#nsi-error').remove();
      if(jQuery.parseJSON(data.responseText).quantity) {
        $("#new_sale_item").find('.btn').after('<p id="nsi-error">Error: '+jQuery.parseJSON(data.responseText).quantity+'</p>');
      } else if(jQuery.parseJSON(data.responseText).errors) {
        $("#new_sale_item").find('.btn').after('<p id="nsi-error">Error: '+jQuery.parseJSON(data.responseText).errors+'</p>');
      }
      $("#sale_item_product").val("");
   });

  $("#sale_item_product").focus();
  $("#sale_item_product").select();


});


function filter_products (term, table_id){
    var query = term.value.toLowerCase();
    var table = document.getElementById(table_id);
    var elm;
    for (var r = 1; r < table.rows.length; r++){
        elm = table.rows[r].cells[0].innerHTML.replace(/<[^>]+>/g,"");
        if (elm.toLowerCase().indexOf(query)>=0 ) {
            table.rows[r].style.display = '';
        } else {
            table.rows[r].style.display = 'none';
        }
    }
}

function create_qrcode(text, typeNumber, errorCorrectLevel, table) {
	var qr = qrcode(typeNumber || 4, errorCorrectLevel || 'M');
	qr.addData(text);
	qr.make();
	return qr.createImgTag();
};
