$(document).ready(function() {
  $('#rootwizard').bootstrapWizard({
    'tabClass': 'nav nav-pills',
    'onNext': function(tab, navigation, index) {
      var $valid = $(".edit_user").valid();
      if(!$valid) {
        $validator.focusInvalid();
        return false;
      }
    },
    onTabClick: function(tab, navigation, index) {
      return false;
    }
  });

  var id = '#'+$('.tab-pane').attr('id')
  $('ul.nav-pills').find('.active').removeClass('active')
  $(id).parent().addClass('active')
});