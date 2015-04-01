$.ajax({
  url: 'news/show',
  dataType: 'json',
  method: 'get'
}).done(function( data ) {
    $('#show_articles').append(JSON.stringify(data));
  });
