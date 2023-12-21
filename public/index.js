const button = document.createElement("button");

button.textContent = "click me";
button.onclick = () => {
  alert("hello world");
};

document.body.append(button);
