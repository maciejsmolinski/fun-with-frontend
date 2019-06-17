exports.currentDateTime = function () {
  var date = new Date();
  return date.toLocaleString('en-GB');
}