$('.tab').hide();

$(document).on('click', '#tab-menu a', function(event) {
  $(this).addClass("active");
  $($(this).attr("href")).show();
  $(document).on('click','#tab-menu .active', function(event) {
      $(this).removeClass("active");
      $($(this).attr("href")).hide();
      event.preventDefault();
    });
    event.preventDefault();
});

