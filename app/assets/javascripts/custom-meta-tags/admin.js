$(function() {

var root = $('#custom-meta-tags');
var index = parseInt($('tr', root).last().attr('data-index'));
if (isNaN(index)) { index = -1; }

root.delegate('a.delete', 'click', function() {
  $(this).parents('tr').remove();
  root.trigger('updated');
  return false;
});

function addMetaTag() {
  index += 1;

  $("#new-meta-tag-template").tmpl({ index: index })
    .appendTo($('tbody', root))
    .find('input:first').focus();

  root.trigger('updated');
}

$('a.add-meta-tag').click(function() {
  addMetaTag();
  return false;
});

});
