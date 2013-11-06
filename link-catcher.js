// Catch any links out to https://gov.uk and kill them

alert("yep");

var els = document.getElementsByTagName('a');

for (var i=0; i<els.length; i++) {
  console.log(this.getAttribute('href'));
}

// Within "Limelight", handle any links clicked WITHOUT the .html suffix