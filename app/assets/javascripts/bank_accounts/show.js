var show = (function() {
    var $btnNewTransaction;
    var $modalTransaction;
    var $btnSaveTransaction;
    var $inputAmount;
    var $selectType;
    var $params;
    var $notification;

    var bankAccountId;
    var endpoint = "/api/v1/bank_accounts/new_transaction";

    var fetchElements = function() {
        $btnNewTransaction = $("#btn-new-transaction");
        $modalTransaction = $("#modal-transaction");
        $btnSaveTransaction = $("#btn-save");
        $inputAmount = $("#input-amount");
        $selectType = $("#select-types");
        $params = $("#parameters");
        $notification = $(".notification");

        bankAccountId = $params.data("bank-account-id");
    };

    var disableControls = function() {
        $btnSaveTransaction.prop("disabled", true);
        $inputAmount.prop("disabled", true);
        $selectType.prop("disabled", true); 
    };

    var enableControls = function() {
        $btnSaveTransaction.prop("disabled", false);
        $inputAmount.prop("disabled", false);
        $selectType.prop("disabled", false); 
    };

    var intializeEvents = function(){
      $btnNewTransaction.on("click", function() {
        $modalTransaction.modal("show");
      });

      $btnSaveTransaction.on("click", function() {
        var amount = $inputAmount.val();
        var type = $selectType.val();
        disableControls();

        $notification.html("");

        $.ajax({
             url: endpoint, 
             method: 'POST',
             dataType: 'json',
             data: {
                 amount: amount,
                 transaction_type: type,
                 bank_account_id: bankAccountId
             },
             success: function(response) {
                window.location.href = "/bank_accounts/" + bankAccountId;
             },
             error: function(response) {
                 $notification.html(JSON.parse(response.responseText).errors.join());
                 enableControls();
             }
        });
      });
    };

    var init = function() {
        fetchElements();
        intializeEvents();
    };

    return{
        init: init
    };
})();