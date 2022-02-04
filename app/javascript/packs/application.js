// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", () => {
  // Form Validation
  const url = document.querySelector("#url");
  const urlError = document.querySelector("#url + span.error");
  const form = document.querySelector("form");
  const submitBtn = document.querySelector(".submit input");
  const regExp =
    /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/;

  form.addEventListener("submit", function (e) {
    if (!url.checkValidity() || !regExp.test(url.value)) {
      showError();
      e.preventDefault();
    }
  });

  url.addEventListener("input", handleURLInput);

  function handleURLInput(e) {
    if (url.checkValidity() || regExp.test(url.value)) {
      urlError.textContent = "";
      urlError.className = "error";
      submitBtn.disabled = false;
    } else {
      showError();
    }
  }

  function showError() {
    if (url.validity.valueMissing) {
      urlError.textContent = "Url field cannot be blank";
    } else if (!regExp.test(url.value)) {
      urlError.textContent = "Invalid URL";
    }
    submitBtn.disabled = true;
    urlError.className = "error active";
  }
});
