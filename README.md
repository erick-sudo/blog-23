# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<input name="article[posters][]" type="hidden" value="" autocomplete="off">
<input multiple="multiple" type="file" name="article[posters][]" id="article_posters">

The first input tag is a hidden input field that appears to be related to an article's posters. The name of the input field is set to article[posters][], which suggests that posters is an attribute on the Article model that accepts an array of values.

The value attribute is set to an empty string, which means that no value will be submitted for this input field.

The autocomplete attribute is set to off, which disables autocomplete suggestions for this input field.

The second input tag is a file input field that allows multiple files to be selected. The name of the input field is also set to article[posters][], which suggests that it is related to the same posters attribute on the Article model. The id attribute is set to article_posters.

When the form is submitted, the selected files will be sent as an array of values under the posters attribute of the article parameter. In the controller, you can permit the posters attribute by using params.require(:article).permit(posters: []).
