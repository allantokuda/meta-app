MetaApp.Router.map(function() {
  LOG_TRANSITIONS: true;
  this.resource('records', function() {
    this.route('foo');
  });
});
