function newSearchListener() {
  $("#scene").on("click", $(".new-search"), function() {
    $('html,body').animate({scrollTop: $(".intro").offset().top},'slow');
  })
}

$( document ).on('turbolinks:load', function() {
  console.log("It works on each visit!")
  newSearchListener()
})