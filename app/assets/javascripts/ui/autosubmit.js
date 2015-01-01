(function(){
    'use strict';

    window.Absolventa    = window.Absolventa || {};
    window.Absolventa.UI = window.Absolventa.UI || {};

   /**
    * Sets up autosubmit functionality
    * expects your element to have following data-attributes
    *
    * [data-action="autosubmit"]
    *
    * Add:
    *
    * [data-submit-button="false"]
    *
    * to automatically hide the submit button
    */

    window.Absolventa.UI.Autosubmit = (function(){
        var init,
             hideFormButtons,
             setupOnChangeEvent;

        setupOnChangeEvent = function(form) {
            var $inputs;

            $inputs = $(form).find('input[type="checkbox"], input[type="select"], select');

            $inputs.each(function() {
                $(this).on('change', function() {
                    if (Modernizr && !Modernizr.input.placeholder) {
                        Absolventa.Global.emptyPlaceHolderInputsInForm($(this).closest('form'));
                    }
                    $(form).submit();
                });
            });

        };

        hideFormButtons = function(form) {

            var $button;

            $button = $(form).find('[type="submit"]');
            $button.hide();

            $button.siblings('label').hide();

        };

        init = function() {

            var forms;

            forms = $('[data-action="autosubmit"]');

            if(forms.length > 0) {

                forms.each(function() {
                    var that = this;
                    if($(that).data('submit-button') === false){
                        hideFormButtons(that);
                    }

                    setupOnChangeEvent(that);

                });
            }

        };

        return {
            init: init
        };

    }());

}());
