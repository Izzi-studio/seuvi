<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-information" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
                    <ul class="nav nav-tabs">

                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>

                    </ul>
                    <div class="tab-content">

                        <div class="tab-pane active" id="tab-general">
                            <ul class="nav nav-tabs" id="language">
                                <?php foreach ($languages as $language) { ?>
                                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                <?php } ?>
                            </ul>

                            <div class="tab-content">
                                <?php foreach ($languages as $language) { ?>
                                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                    <!-- multilingual start -->


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
                                        <div class="col-sm-10">
                                            <input name="faq_description[<?php echo $language['language_id']; ?>][title]" class="form-control" value="<?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['title'] : ''; ?>" />
                                            <?php if (isset($error_title[$language['language_id']])) { ?>
                                            <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                                            <?php } ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="faq_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['description'] : ''; ?></textarea>
                                        </div>
                                    </div>

                                    <!-- multilingual ends -->
                                </div>
                                <?php } ?>
                            </div> <!-- language tab ends -->

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-favorites"><span data-toggle="tooltip" title="Избранные"><?php echo $entry_in_product; ?></span></label>
                                <div class="col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <?php if ($in_product) { ?>
                                            <input type="checkbox" name="in_product" value="1" checked="checked" id="input-favorites" />
                                            <?php } else { ?>
                                            <input type="checkbox" name="in_product" value="1" id="input-favorites" />
                                            <?php } ?>
                                            &nbsp; </label>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- tab-general ends -->


                        <div class="tab-pane" id="tab-links">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_category; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-product" class="form-control" />
                                    <div id="category" class="well well-sm" style="height: 150px; overflow: auto;">
                                        <?php foreach ($categories_faq as $category) { ?>
                                        <div id="product<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                                            <input type="hidden" name="category[]" value="<?php echo $category['category_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- tab-links ends -->



                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript"><!--
    <?php foreach ($languages as $language) { ?>
        $('#description<?php echo $language['language_id']; ?>').summernote({
            height: 250,
            toolbar: [
                ['style', ['style']], // no style button
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                ['fontsize', ['fontsize']],
                ['fontname', ['fontname']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['table', ['table']], // no table button
                ['insert', ['picture', 'link', 'video', 'hr']], // no insert buttons
                ['codeview', ['fullscreen', 'codeview']] //no help button
            ]
        });
    <?php } ?>
    //--></script>
<script type="text/javascript"><!--
    $('#language a:first').tab('show');
    //--></script>

<script type="text/javascript"><!--
    // Category
    $('input[name=\'category\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['category_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'category\']').val('');

            $('#category' + item['value']).remove();

            $('#category').append('<div id="category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#category').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    //--></script>
<?php echo $footer; ?>