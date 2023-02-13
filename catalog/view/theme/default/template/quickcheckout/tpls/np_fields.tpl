<div id="np_fields">
    <div class="entry_label">
        <?php echo $entry_city; ?>
    </div>
    <select style="width: 100%;" id="result_np_city_api" name="city"></select>
    <div class="entry_label">
        <?php echo $entry_warehouse; ?>
    </div>
    <select style="width: 100%" id="result_np_warehouse_api" name="address_1"></select>
</div>




<script type="text/javascript">

    $("#result_np_city_api").select2({
        shouldFocusInput: function() {
            return true;
        },
        minimumInputLength: 3,
        placeholder: $('[data-trans-city]').attr('data-trans-city'),
        multiple: !1,
        quietMillis: 350,
        language: {
            inputTooShort: function () {
                return $('[inputtooshort]').attr('inputtooshort');
            },
            noResults: function () {
                return $('[noresults]').attr('noresults');
            },
            searching: function () {
                return  $('[searching]').attr('searching');;
            },
        },
        ajax: {
            type: "POST",
            dataType: "json",
            url: "index.php?route=quickcheckout/shippingdata&method=getCity",
            data: function (t) {
                return JSON.stringify({findString: t.term});
            },
            headers: { "Content-Type": "application/json" },
            processResults: function (t) {
                return {
                    results:
                        $.map(t, function (obj) {
                            return {
                                id: obj.city+'^'+obj.ref,
                                text: obj.city,
                            };
                        })
                }
            },
        },
    })


    /*var timer;

    $('#np_fields input[name="cityapi"]').on('keyup', function() {
        var  findString = $(this).val();
        window.clearTimeout(timer);
        timer = setTimeout(function () {
            $.ajax({
                url: 'index.php?route=quickcheckout/shippingdata&method=getCity',
                type: 'post',
                data: 'findString='+findString,
                dataType: 'html',
                cache: false,
                success: function(data) {
                    $('#result_np_city_api').html('');
                    var html= '';
                    $.each(JSON.parse(data), function (i,v) {
                        html += "<option value="+v.city+" ref="+v.ref+">"+v.city+"</option>"
                    })
                    $('#result_np_city_api').html(html);
                }
            });
        }, 2000);
    })*/
</script>


<script type="text/javascript">

    $("#result_np_warehouse_api").select2({
        shouldFocusInput: function() {
            return true;
        },
        minimumInputLength: 1,
        placeholder: $('[data-trans-city]').attr('data-trans-city'),
        multiple: !1,
        quietMillis: 350,
        language: {
            inputTooShort: function () {
                return $('[inputtooshort]').attr('inputtooshort');
            },
            noResults: function () {
                return $('[noresults]').attr('noresults');
            },
            searching: function () {
                return  $('[searching]').attr('searching');;
            },
        },
        ajax: {
            type: "POST",
            dataType: "json",
            url: "index.php?route=quickcheckout/shippingdata&method=getWarehouse",
            data: function (t) {
                return JSON.stringify({findString: t.term,
                    findString: t.term,
                    ref: $('#np_fields select[name="city"]').val().split("^")[1]
                });
            },
            headers: { "Content-Type": "application/json" },
            processResults: function (t) {
                return {
                    results:
                        $.map(t, function (obj) {
                            return {
                                id: obj.warehouse,
                                text: obj.warehouse,
                            };
                        })
                }
            },
        },
    })








    /*$('#np_fields input[name="warehouses"]').on('keyup', function() {
        var  findString = $(this).val();
        window.clearTimeout(timer);
        timer = setTimeout(function () {
        $.ajax({
            url: 'index.php?route=quickcheckout/shippingdata&method=getWarehouse',
            type: 'post',
            data: 'findString='+findString+'&ref='+$('#np_fields select[name="city"]').find(":selected").attr('ref'),
            dataType: 'html',
            cache: false,
            success: function(data) {
                $('#result_np_warehouse_api').html('');
                var html= '';
                $.each(JSON.parse(data), function (i,v) {
                    console.log(v.warehouse)
                    html += '<option value="'+v.warehouse+'">'+v.warehouse+'</option>'
                })
                $('#result_np_warehouse_api').html(html);

            }

        });
        }, 2000);
    })*/
</script>