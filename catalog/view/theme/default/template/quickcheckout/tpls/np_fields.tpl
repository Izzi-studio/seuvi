<div id="np_fields">
    <?php echo $entry_city; ?>
    <input name="cityapi" type="text"/>
    <select id="result_np_city_api" name="city"></select>
    <?php echo $entry_warehouse; ?>
    <input name="warehouses" type="text"/>
    <select id="result_np_warehouse_api" name="address_1"></select>
</div>


<script type="text/javascript">
    var timer;

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


    })
</script>


<script type="text/javascript">
    $('#np_fields input[name="warehouses"]').on('keyup', function() {
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
    })
</script>