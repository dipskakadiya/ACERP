<style type="text/css" media="all">@import "plugins/3dimage/css/annotation.css";</style>
<script type="text/javascript" src="plugins/3dimage/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="plugins/3dimage/js/jquery-ui-1.8.17.js"></script>
<!--<script type="text/javascript" src="plugins/3dimage/js/jquery.annotate.js"></script>-->

<script>
    $(document).ready(function(){
    });
</script>


<script>
    /// <reference path="jquery-1.2.6-vsdoc.js" />
    (function($) {

        $.fn.annotateImage = function(options) {
            ///	<summary>
            ///		Creates annotations on the given image.
            ///     Images are loaded from the "getUrl" propety passed into the options.
            ///	</summary>
            var opts = $.extend({}, $.fn.annotateImage.defaults, options);
            var image = this;

            this.image = this;
            this.mode = 'view';

            // Assign defaults
            this.getUrl = opts.getUrl;
            this.saveUrl = opts.saveUrl;
            this.deleteUrl = opts.deleteUrl;
            this.editable = opts.editable;
            this.useAjax = opts.useAjax;
            this.notes = opts.notes;

            // Add the canvas
            this.canvas = $('<div class="image-annotate-canvas"><div class="image-annotate-view"></div><div class="image-annotate-edit"><div class="image-annotate-edit-area"></div></div></div>');
            this.canvas.children('.image-annotate-edit').hide();
            this.canvas.children('.image-annotate-view').hide();
            this.image.after(this.canvas);

            // Give the canvas and the container their size and background
            this.canvas.height(600);
            this.canvas.width(2250);
            this.canvas.css('background-image', 'url("' + this.attr('src') + '")');
            this.canvas.children('.image-annotate-view, .image-annotate-edit').height(600);
            this.canvas.children('.image-annotate-view, .image-annotate-edit').width(2250);

            // Add the behavior: hide/show the notes when hovering the picture
            this.canvas.hover(function() {
                if ($(this).children('.image-annotate-edit').css('display') == 'none') {
                    $(this).children('.image-annotate-view').show();
                }
            }, function() {
                $(this).children('.image-annotate-view').hide();
            });

            this.canvas.children('.image-annotate-view').hover(function() {
                $(this).show();
            }, function() {
                $(this).hide();
            });

            // load the notes
            if (this.useAjax) {
                $.fn.annotateImage.ajaxLoad(this);
            } else {
                $.fn.annotateImage.load(this);
            }

            // Add the "Add a note" button
            if (this.editable) {
                this.button = $('<a class="image-annotate-add" id="image-annotate-add" href="#">Add Note</a>');
                this.button.click(function() {
                    $.fn.annotateImage.add(image);
                });
                this.canvas.after(this.button);
            }

            // Hide the original
            this.hide();

            return this;
        };

        /**
         * Plugin Defaults
         **/
        $.fn.annotateImage.defaults = {
            getUrl: 'your-get.rails',
            saveUrl: 'your-save.rails',
            deleteUrl: 'your-delete.rails',
            editable: true,
            useAjax: true,
            notes: new Array()
        };

        $.fn.annotateImage.clear = function(image) {
            ///	<summary>
            ///		Clears all existing annotations from the image.
            ///	</summary>    
            for (var i = 0; i < image.notes.length; i++) {
                image.notes[image.notes[i]].destroy();
            }
            image.notes = new Array();
        };

        $.fn.annotateImage.ajaxLoad = function(image) {
            ///	<summary>
            ///		Loads the annotations from the "getUrl" property passed in on the
            ///     options object.
            ///        </summary>
       
            image.notes = <%
                String msg = "[";
                List lt = (List) request.getAttribute("data");
                HashMap hm = null;
                if (lt != null && lt.size() > 0) {
                    for (int j = 0; j < lt.size(); j++) {
                        hm = (HashMap) lt.get(j);
                        msg += "{ \"top\": " + hm.get("TOP") + ", \"left\": " + hm.get("LEFT") + ", \"width\": " + hm.get("WIDTH") + ", \"height\": " + hm.get("HEIGHT") + ", \"text\": \"" + hm.get("ITEM_NAME") + "\", \"id\":" + hm.get("ID") + ", \"editable\": true },";
                    }
                    msg = msg.substring(0, msg.length() - 1);
                    msg += "]";
                    out.println(msg);
                } else {
                    out.print("[{ \"top\": 1, \"left\": 1, \"width\": 1, \"height\": 1, \"text\": \"\", \"id\":1, \"editable\": true }]");
                }
    %>;
                $.fn.annotateImage.load(image);
   
                $.getJSON(image.getUrl + '?ticks=' + $.fn.annotateImage.getTicks(), function(data) {
                    image.notes = data;
                    $.fn.annotateImage.load(image);
                });
            };

            $.fn.annotateImage.load = function(image) {
                ///	<summary>
                ///		Loads the annotations from the notes property passed in on the
                ///     options object.
                ///	</summary>
                for (var i = 0; i < image.notes.length; i++) {
                    image.notes[image.notes[i]] = new $.fn.annotateView(image, image.notes[i]);
                }
            };

            $.fn.annotateImage.getTicks = function() {
                ///	<summary>
                ///		Gets a count og the ticks for the current date.
                ///     This is used to ensure that URLs are always unique and not cached by the browser.
                ///	</summary>        
                var now = new Date();
                return now.getTime();
            };

            $.fn.annotateImage.add = function(image) {
                ///	<summary>
                ///		Adds a note to the image.
                ///	</summary>        
                if (image.mode == 'view') {
                    image.mode = 'edit';

                    // Create/prepare the editable note elements
                    var editable = new $.fn.annotateEdit(image);

                    $.fn.annotateImage.createSaveButton(editable, image);
                    $.fn.annotateImage.createCancelButton(editable, image);
                }
            };

            $.fn.annotateImage.createSaveButton = function(editable, image, note) {
                ///	<summary>
                ///		Creates a Save button on the editable note.
                ///	</summary>
                var ok = $('<a class="image-annotate-edit-ok">OK</a>');

                ok.click(function() {
                    var form = $('#image-annotate-edit-form form');
                    var text = $('#image-annotate-text option:selected').text();
                    $.fn.annotateImage.appendPosition(form, editable)
                    image.mode = 'view';

                    // Save via AJAX
                    if (image.useAjax) {
                        $.ajax({
                            url: image.saveUrl,
                            data: form.serialize(),
                            error: function(e) { alert("An error occured saving that note.") },
                            success: function(data) {
                                if (data.annotation_id != undefined) {
                                    editable.note.id = data.annotation_id;
                                }
                                editable.note.id=data;
                            },
                            dataType: "json"
                        });
                    }

                    // Add to canvas
                    if (note) {
                        note.resetPosition(editable, text);
                    } else {
                        editable.note.editable = true;
                        note = new $.fn.annotateView(image, editable.note)
                        note.resetPosition(editable, text);
                        image.notes.push(editable.note);
                    }

                    editable.destroy();
                });
                editable.form.append(ok);
            };

            $.fn.annotateImage.createCancelButton = function(editable, image) {
                ///	<summary>
                ///		Creates a Cancel button on the editable note.
                ///	</summary>
                var cancel = $('<a class="image-annotate-edit-close">Cancel</a>');
                cancel.click(function() {
                    editable.destroy();
                    image.mode = 'view';
                });
                editable.form.append(cancel);
            };

            $.fn.annotateImage.saveAsHtml = function(image, target) {
                var element = $(target);
                var html = "";
                for (var i = 0; i < image.notes.length; i++) {
                    html += $.fn.annotateImage.createHiddenField("text_" + i, image.notes[i].text);
                    html += $.fn.annotateImage.createHiddenField("top_" + i, image.notes[i].top);
                    html += $.fn.annotateImage.createHiddenField("left_" + i, image.notes[i].left);
                    html += $.fn.annotateImage.createHiddenField("height_" + i, image.notes[i].height);
                    html += $.fn.annotateImage.createHiddenField("width_" + i, image.notes[i].width);
                }
                element.html(html);
            };

            $.fn.annotateImage.createHiddenField = function(name, value) {
                return '&lt;input type="hidden" name="' + name + '" value="' + value + '" /&gt;<br />';
            };

            $.fn.annotateEdit = function(image, note) {
                ///	<summary>
                ///		Defines an editable annotation area.
                ///	</summary>
                this.image = image;

                if (note) {
                    this.note = note;
                } else {
                    var newNote = new Object();
                    newNote.id = "new";
                    newNote.top = 10;
                    newNote.left = 10;
                    newNote.width = 35;
                    newNote.height = 35;
                    newNote.text = "";
                    this.note = newNote;
                }

                // Set area
                var area = image.canvas.children('.image-annotate-edit').children('.image-annotate-edit-area');
                this.area = area;
                this.area.css('height', this.note.height + 'px');
                this.area.css('width', this.note.width + 'px');
                this.area.css('left', this.note.left + 'px');
                this.area.css('top', this.note.top + 'px');

                // Show the edition canvas and hide the view canvas
                image.canvas.children('.image-annotate-view').hide();
                image.canvas.children('.image-annotate-edit').show();

                // Add the note (which we'll load with the form afterwards)
                var form = $('<div id="image-annotate-edit-form"><form><select id="image-annotate-text" name="text"></select></form></div>');
                this.form = form;

                //it dispaly All product combo
                $.ajax({url:"Ajex.htm?action=show_itemAll", success:function(result){
                        $("#image-annotate-text").html(result);
                    }});


                $('body').append(this.form);
                this.form.css('left', this.area.offset().left + 'px');
                this.form.css('top', (parseInt(this.area.offset().top) + parseInt(this.area.height()) + 7) + 'px');

                // Set the area as a draggable/resizable element contained in the image canvas.
                // Would be better to use the containment option for resizable but buggy
                area.resizable({
                    handles: 'all',

                    stop: function(e, ui) {
                        form.css('left', area.offset().left + 'px');
                        form.css('top', (parseInt(area.offset().top) + parseInt(area.height()) + 2) + 'px');
                    }
                })
                .draggable({
                    containment: image.canvas,
                    drag: function(e, ui) {
                        form.css('left', area.offset().left + 'px');
                        form.css('top', (parseInt(area.offset().top) + parseInt(area.height()) + 2) + 'px');
                    },
                    stop: function(e, ui) {
                        form.css('left', area.offset().left + 'px');
                        form.css('top', (parseInt(area.offset().top) + parseInt(area.height()) + 2) + 'px');
                    }
                });
                return this;
            };

            $.fn.annotateEdit.prototype.destroy = function() {
                ///	<summary>
                ///		Destroys an editable annotation area.
                ///	</summary>        
                this.image.canvas.children('.image-annotate-edit').hide();
                this.area.resizable('destroy');
                this.area.draggable('destroy');
                this.area.css('height', '');
                this.area.css('width', '');
                this.area.css('left', '');
                this.area.css('top', '');
                this.form.remove();
            }

            $.fn.annotateView = function(image, note) {
                ///	<summary>
                ///		Defines a annotation area.
                ///	</summary>
                this.image = image;

                this.note = note;

                this.editable = (note.editable && image.editable);

                // Add the area
                this.area = $('<div class="image-annotate-area' + (this.editable ? ' image-annotate-area-editable' : '') + '"><div></div></div>');
                image.canvas.children('.image-annotate-view').prepend(this.area);

                // Add the note
                this.form = $('<div class="image-annotate-note">' + note.text + '</div>');
                this.form.hide();
                image.canvas.children('.image-annotate-view').append(this.form);
                this.form.children('span.actions').hide();

                // Set the position and size of the note
                this.setPosition();

                // Add the behavior: hide/display the note when hovering the area
                var annotation = this;
                this.area.hover(function() {
                    annotation.show();
                }, function() {
                    annotation.hide();
                });

                // Edit a note feature
                if (this.editable) {
                    var form = this;
                    this.area.click(function() {
                        form.edit();
                    });
                }
            };

            $.fn.annotateView.prototype.setPosition = function() {
                ///	<summary>
                ///		Sets the position of an annotation.
                ///	</summary>
                this.area.children('div').height((parseInt(this.note.height) - 2) + 'px');
                this.area.children('div').width((parseInt(this.note.width) - 2) + 'px');
                this.area.css('left', (this.note.left) + 'px');
                this.area.css('top', (this.note.top) + 'px');
                this.form.css('left', (this.note.left) + 'px');
                this.form.css('top', (parseInt(this.note.top) + parseInt(this.note.height) + 7) + 'px');
            };

            $.fn.annotateView.prototype.show = function() {
                ///	<summary>
                ///		Highlights the annotation
                ///	</summary>
                this.form.fadeIn(250);
                if (!this.editable) {
                    this.area.addClass('image-annotate-area-hover');
                } else {
                    this.area.addClass('image-annotate-area-editable-hover');
                }
            };

            $.fn.annotateView.prototype.hide = function() {
                ///	<summary>
                ///		Removes the highlight from the annotation.
                ///	</summary>      
                this.form.fadeOut(250);
                this.area.removeClass('image-annotate-area-hover');
                this.area.removeClass('image-annotate-area-editable-hover');
            };

            $.fn.annotateView.prototype.destroy = function() {
                ///	<summary>
                ///		Destroys the annotation.
                ///	</summary>      
                this.area.remove();
                this.form.remove();
            }

            $.fn.annotateView.prototype.edit = function() {
                ///	<summary>
                ///		Edits the annotation.
                ///	</summary>      
                if (this.image.mode == 'view') {
                    this.image.mode = 'edit';
                    var annotation = this;

                    // Create/prepare the editable note elements
                    var editable = new $.fn.annotateEdit(this.image, this.note);

                    $.fn.annotateImage.createSaveButton(editable, this.image, annotation);

                    // Add the delete button
                    var del = $('<a class="image-annotate-edit-delete">Delete</a>');
                    del.click(function() {
                        var form = $('#image-annotate-edit-form form');

                        $.fn.annotateImage.appendPosition(form, editable)

                        if (annotation.image.useAjax) {
                            $.ajax({
                                url: annotation.image.deleteUrl,
                                data: form.serialize(),
                                error: function(e) { alert("An error occured deleting that note.") }
                            });
                        }

                        annotation.image.mode = 'view';
                        editable.destroy();
                        annotation.destroy();
                    });
                    editable.form.append(del);

                    $.fn.annotateImage.createCancelButton(editable, this.image);
                }
            };

            $.fn.annotateImage.appendPosition = function(form, editable) {
                ///	<summary>
                ///		Appends the annotations coordinates to the given form that is posted to the server.
                ///	</summary>
                var areaFields = $('<input type="hidden" value="' + editable.area.height() + '" name="height"/>' +
                    '<input type="hidden" value="' + editable.area.width() + '" name="width"/>' +
                    '<input type="hidden" value="' + editable.area.position().top + '" name="top"/>' +
                    '<input type="hidden" value="' + editable.area.position().left + '" name="left"/>' +
                    '<input type="hidden" value="' + editable.note.id + '" name="id"/>');
                form.append(areaFields);
            }

            $.fn.annotateView.prototype.resetPosition = function(editable, text) {
                ///	<summary>
                ///		Sets the position of an annotation.
                ///	</summary>
                this.form.html(text);
                this.form.hide();

                // Resize
                this.area.children('div').height(editable.area.height() + 'px');
                this.area.children('div').width((editable.area.width() - 2) + 'px');
                this.area.css('left', (editable.area.position().left) + 'px');
                this.area.css('top', (editable.area.position().top) + 'px');
                this.form.css('left', (editable.area.position().left) + 'px');
                this.form.css('top', (parseInt(editable.area.position().top) + parseInt(editable.area.height()) + 7) + 'px');

                // Save new position to note
                this.note.top = editable.area.position().top;
                this.note.left = editable.area.position().left;
                this.note.height = editable.area.height();
                this.note.width = editable.area.width();
                this.note.text = text;
                this.note.id = editable.note.id;
                this.editable = true;
            };

        })(jQuery);
</script>





<script language="javascript">
    
    $(window).load(function() {
        $("#toAnnotate").annotateImage({
            getUrl: "Ajex.htm?action=Item3dtagget",
            saveUrl: "Ajex.htm?action=Item3dtagsave",
            deleteUrl: "Ajex.htm?action=Item3dtagDelete",
            editable:true
        });
       
    });
</script>
<!--<div  class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Add Image Position</span>
    </div>
    <div class="mws-panel-body">-->

<div style="overflow:auto; width: 950px; height: 650px">
    <img id="toAnnotate" src="plugins/3dimage/images/View_from_Sky_Tower_Akl_small.jpg" alt="Trafalgar Square" width="1995px;" height="500" />
</div>
<!--    </div>
</div>-->
