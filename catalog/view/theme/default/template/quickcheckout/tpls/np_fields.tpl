<div id="np_fields">
    <input name="city" type="text"/>
    <select id="result_np_city_api" name="additional[city]"></select>
    <input name="warehouses" type="text"/>
    <select id="result_np_warehouse_api" name="additional[warehouse]"></select>
</div>


<script type="text/javascript">
    var timer;

    $('#np_fields input[name="city"]').on('keyup', function() {
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
            data: 'findString='+findString+'&ref='+$('#np_fields select[name="additional[city]"]').find(":selected").attr('ref'),
            dataType: 'html',
            cache: false,
            success: function(data) {
                $('#result_np_warehouse_api').html('');
                var html= '';
                $.each(JSON.parse(data), function (i,v) {
                    html += "<option value="+v.warehouse+" ref="+v.ref+">"+v.warehouse+"</option>"
                })
                $('#result_np_warehouse_api').html(html);

            }

        });
        }, 2000);
    })
</script>