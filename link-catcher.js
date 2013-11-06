// No idea why the logo needs hacking, probably my lame indexOf stuff below
var logo = document.getElementById('logo');
logo.onclick = function() {
  return false;
};

document.onclick = function(event) {
    var el = event.target;
    if (el.nodeName == "A") {
      var link = el.getAttribute('href');
      // Catch any links out to https://gov.uk (etc) and kill them
      if (link.indexOf('https://www.gov.uk/') != -1 || link.indexOf('https://www.surveymonkey.com/') != -1 || link.indexOf('http://digital.cabinetoffice.gov.uk/') != -1 || link.indexOf('http://www.nationalarchives.gov.uk/') != -1) {
        return false;
      }
      // Within "Limelight", handle any links clicked WITHOUT the .html suffix
      if (link.indexOf('.html') == -1) {
        window.location.href = link + '.html';
        return false;
      }
    }
};