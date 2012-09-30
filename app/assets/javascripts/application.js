//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require mustache

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
   });



});