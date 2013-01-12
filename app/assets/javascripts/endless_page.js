var currentPage = 1;

function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage++;
    var from_date = document.getElementById("from_date").value;
    var to_date =   document.getElementById("to_date").value;
    new Ajax.Request("/statistics?to_date="+to_date+"&from_date="+from_date+"&page=" + currentPage, {asynchronous:true, evalScripts:true, method:'get'});
  } else {
    setTimeout("checkScroll()", 250);
  }
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}

document.observe('dom:loaded', checkScroll);
