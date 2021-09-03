function clickStar() {
  var bookId = event.target.parentNode.getAttribute("book")
  var score = event.target.getAttribute("score")
  var name = "user[books_user][" + event.target.parentNode.getAttribute("book") + "][score]"

  var input = document.createElement("input");

  input.setAttribute("type", "hidden");
  input.setAttribute("name", name);
  input.setAttribute("value", score);

  var oldScore = event.target.parentNode.getElementsByClassName("scored");
  if (oldScore.length > 0) {
    oldScore[0].classList.remove("scored")
  }

  event.target.parentNode.appendChild(input);

  event.target.classList.toggle("scored");
}
